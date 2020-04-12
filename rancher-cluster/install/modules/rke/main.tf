resource rke_cluster "rancher-cluster" {
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
  filename = "${path.root}/../rke_data/kube_config_${var.environment_name}.yml"
  content = rke_cluster.rancher-cluster.kube_config_yaml
}

resource "local_file" "rke_state" {
  filename = "${path.root}/../rke_data/cluster.rkestate"
  content = rke_cluster.rancher-cluster.rke_state
}

resource "local_file" "rke_cluster_yaml" {
  filename = "${path.root}/../rke_data/cluster.yml"
  content = rke_cluster.rancher-cluster.rke_cluster_yaml
}
