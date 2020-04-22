resource rke_cluster "devcloud_cluster" {

  cluster_name = var.environment_name

  dynamic nodes {
    for_each = var.nodes

    content {
      address = nodes.value.address
      user    = var.ssh_user
      role    = nodes.value.roles
      ssh_key = file(var.private_ssh_key_file)
      ssh_key_path = var.private_ssh_key_file

    }

  }

  services {
    kube_api {
      service_cluster_ip_range =  var.service_ip_range
      service_node_port_range = "30000-32767"
      always_pull_images = true
    }

    kube_controller {
      cluster_cidr =  var.pod_ip_range
      service_cluster_ip_range =  var.service_ip_range
    }

    kubelet {
      cluster_domain =  "cluster.local"
      cluster_dns_server =  var.cluster_dns_ip
    }
  }

  network {
    plugin = "canal"
  }

}

resource "local_file" "kubeconfig_yaml" {
  filename = "${path.root}/rke_data/kube_config_${var.environment_name}.yml"
  content = rke_cluster.devcloud_cluster.kube_config_yaml
}

resource "local_file" "rke_state" {
  filename = "${path.root}/rke_data/cluster.rkestate"
  content = rke_cluster.devcloud_cluster.rke_state
}

resource "local_file" "rke_cluster_yaml" {
  filename = "${path.root}/rke_data/cluster.yml"
  content = rke_cluster.devcloud_cluster.rke_cluster_yaml
}

provider "rancher2" {
  alias = "bootstrap"
  api_url   = "https://${var.rancher_hostname}"
  bootstrap = true
  insecure = true

}

resource "rancher2_bootstrap" "admin" {
  depends_on = [rke_cluster.devcloud_cluster]
  provider = rancher2.bootstrap
  current_password = var.rancher_admin_password
  password = var.rancher_admin_password
}

provider "rancher2" {
  alias = "admin"
  api_url = "https://${var.rancher_hostname}"
  token_key = rancher2_bootstrap.admin.token
  insecure = true
}

resource "rancher2_cluster" "devcloud_cluster_import" {
  depends_on = [rke_cluster.devcloud_cluster]
  provider = rancher2.admin
  name = "devcloud-cluster"
  description = "rancher devcloud cluster"
  enable_cluster_monitoring = true
  cluster_monitoring_input {
    answers = {
      "exporter-kubelets.https" = true
      "exporter-node.enabled" = true
      "exporter-node.ports.metrics.port" = 9796
      "exporter-node.resources.limits.cpu" = "200m"
      "exporter-node.resources.limits.memory" = "200Mi"
      "grafana.persistence.enabled" = false
      "grafana.persistence.size" = "5Gi"
      "grafana.persistence.storageClass" = "default"
      "operator.resources.limits.memory" = "500Mi"
      "prometheus.persistence.enabled" = "false"
      "prometheus.persistence.size" = "10Gi"
      "prometheus.persistence.storageClass" = "default"
      "prometheus.persistent.useReleaseName" = "true"
      "prometheus.resources.core.limits.cpu" = "1000m",
      "prometheus.resources.core.limits.memory" = "1500Mi"
      "prometheus.resources.core.requests.cpu" = "750m"
      "prometheus.resources.core.requests.memory" = "750Mi"
      "prometheus.retention" = "12h"
    }
  }
}

resource "rancher2_project_logging" "elasticsearchlog" {
  depends_on = [rke_cluster.devcloud_cluster]
  provider = rancher2.admin
  name = "elasticsearch-config"
  project_id = rancher2_cluster.devcloud_cluster_import.default_project_id
  kind = "elasticsearch"
  elasticsearch_config {
    endpoint = "http://host.javaansehz.cloud:9200"
    index_prefix = "devcloud-cluster-project"
    ssl_verify = false
  }
}

resource "rancher2_registry" "host_registry" {
  depends_on = [rke_cluster.devcloud_cluster]
  provider = rancher2.admin
  name = "host-registry"
  description = "host-registry"
  project_id = rancher2_cluster.devcloud_cluster_import.default_project_id
  registries {
    address = "host.javaansehz.cloud:5555"
  }
}

# register cluster to rancher
resource "null_resource" register_cluster {
  depends_on = [rke_cluster.devcloud_cluster]
  provisioner "local-exec" {
    command = "curl --insecure -sfL  ${rancher2_cluster.devcloud_cluster_import.cluster_registration_token[0].manifest_url} | kubectl --kubeconfig ${local_file.kubeconfig_yaml.filename} apply -f -"
  }
}
