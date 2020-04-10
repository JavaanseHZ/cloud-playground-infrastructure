resource rke_cluster "rancher-cluster" {
  cluster_name = var.environment_name

  dynamic nodes {
    for_each = var.nodes

    content {
      address = nodes.value.ipv4_address
      hostname_override = nodes.value.name
      internal_address = lookup(var.private_ips, nodes.value.id, 0)
      user    = var.ssh_user
      role    = ["controlplane", "etcd", "worker"]
      ssh_key = file(var.private_ssh_key_file)
    }
  }

  network {
    plugin = "canal"
  }
}

resource "local_file" "kubeconfig-yaml" {
  filename = "${path.root}/kube_config_${var.environment_name}.yml"
  content = rke_cluster.rancher-cluster.kube_config_yaml
}

resource "local_file" "rke_state" {
  filename = "${path.root}/rke_data/cluster.rkestate"
  content = rke_cluster.rancher-cluster.rke_state
}

resource "local_file" "rke_cluster_yaml" {
  filename = "${path.root}/rke_data/cluster.yml"
  content = rke_cluster.rancher-cluster.rke_cluster_yaml
}
