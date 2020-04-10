terraform {
  backend "s3" {
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
  }
}

module "servers" {
  source = "./modules/servers"

  environment_name = var.environment_name
  node_count = var.node_count
  server_type = var.server_type
  location = var.server_location
}

module "rke" {
  source = "./modules/rke"

  nodes = module.servers.nodes
  environment_name = var.environment_name
  private_ips = module.servers.private_ips
}

provider "kubernetes" {
  host = module.rke.cluster.api_server_url
  client_certificate = module.rke.cluster.client_cert
  client_key = module.rke.cluster.client_key
  cluster_ca_certificate = module.rke.cluster.ca_crt
}

module "rancher" {
  source = "./modules/rancher"

  kubeconfig_file = module.rke.kubeconfig_file
  kubernetes_cluster = module.rke.cluster
  rancher_hostname = var.rancher_hostname
  letsencrypt_email = var.rancher_letsencrypt_email
}
