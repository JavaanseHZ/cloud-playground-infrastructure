terraform {

}

module "rke" {
  source           = "./modules/rke"
  nodes            = var.servers
  environment_name = var.environment_name
}

provider "kubernetes" {
  host                   = module.rke.cluster.api_server_url
  client_certificate     = module.rke.cluster.client_cert
  client_key             = module.rke.cluster.client_key
  cluster_ca_certificate = module.rke.cluster.ca_crt
}

module "rancher_install" {
  source = "./modules/rancher/install"

  kubeconfig_file      = module.rke.kubeconfig_file
  kubernetes_cluster   = module.rke.cluster
  rancher_hostname     = var.rancher_hostname
  rancher_version      = var.rancher_version
  cert_manager_version = var.cert_manager_version
}

module "rancher_config" {
  source = "./modules/rancher/config"
  nodes                   = var.servers
  rancher_admin_password  = var.rancher_admin_password
}
