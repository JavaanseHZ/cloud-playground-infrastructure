environment_name        = "control"
rancher_hostname        = "control"
cert_manager_version    = "0.12.0"
rancher_version         = "v2.3.6"

nodes = {
  1 = {
    name                = "control"
    address             = "172.22.101.100"
    roles               = ["controlplane", "etcd", "worker"]
  }
}
