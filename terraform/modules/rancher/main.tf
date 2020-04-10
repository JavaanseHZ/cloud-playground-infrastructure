provider "helm" {
  kubernetes {
    host = var.kubernetes_cluster.api_server_url
    client_certificate = var.kubernetes_cluster.client_cert
    client_key = var.kubernetes_cluster.client_key
    cluster_ca_certificate = var.kubernetes_cluster.ca_crt
  }
}

resource "null_resource" "cert-manager-crds" {
  provisioner "local-exec" {
    command = "kubectl --kubeconfig ${var.kubeconfig_file} apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.14/deploy/manifests/00-crds.yaml"
  }
}

resource "kubernetes_namespace" "cert-manager-ns" {
  metadata {
    annotations = {
      name = "cert-manager"
    }

    name = "cert-manager"
  }
  timeouts {
    delete = "3m"
  }
}

data "helm_repository" "jetstack" {
  name = "jetstack"
  url  = "https://charts.jetstack.io"
}

resource "helm_release" "cert-manager" {
  depends_on = [null_resource.cert-manager-crds, kubernetes_namespace.cert-manager-ns]
  name       = "cert-manager"
  namespace = "cert-manager"
  repository = data.helm_repository.jetstack.metadata.0.name
  chart      = "cert-manager"
  version    = "v${var.cert_manager_version}"
  wait = true
}

resource "kubernetes_namespace" "cattle-system-ns" {
  metadata {
    annotations = {
      name = "cattle-system"
    }

    name = "cattle-system"
  }

  timeouts {
    delete = "3m"
  }
}

data "helm_repository" "rancher-stable" {
  name = "rancher-stable"
  url  = "https://releases.rancher.com/server-charts/stable"
}

resource "helm_release" "rancher" {
  depends_on = [helm_release.cert-manager, kubernetes_namespace.cattle-system-ns]
  name       = "rancher"
  namespace = "cattle-system"
  repository = data.helm_repository.rancher-stable.metadata.0.name
  chart      = "rancher"
  version = var.rancher_version
  wait = true

  set {
    name  = "hostname"
    value = var.rancher_hostname
  }

  set {
    name = "ingress.tls.source"
    value = "rancher"
  }

  set {
    name  = "certmanager.version"
    value = var.cert_manager_version
  }

}
