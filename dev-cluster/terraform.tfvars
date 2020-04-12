environment_name        = "devcloud"
rancher_hostname        = "control"
rancher_admin_password  = "admin"

nodes = {
  1 = {
    name                = "master"
    address             = "172.22.101.101"
    roles               = ["controlplane", "etcd", "worker"]
  },
  2 = {
    name                = "worker"
    address             = "172.22.101.102"
    roles               = ["worker"]
  }
}
