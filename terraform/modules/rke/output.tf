output "cluster" {
  value = rke_cluster.rancher-cluster
}

output "kubeconfig_file" {
  value = local_file.kubeconfig-yaml.filename
}
