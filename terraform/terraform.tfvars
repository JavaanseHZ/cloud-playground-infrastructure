environment_name        = "control"
rancher_hostname        = "control"
cert_manager_version    = "0.12.0"
rancher_version         = "v2.3.6"
rancher_admin_password  = "admin"

servers = {
  1 = {
    name                = "control"
    address             = "172.22.101.100"
    roles               = ["controlplane", "etcd", "worker"]
  },

  2 = {
    name                = "worker"
    address             = "172.22.101.101"
    roles               = ["worker"]
  }
}
