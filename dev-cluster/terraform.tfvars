environment_name        = "devcloud.javaansehz.cloud"
rancher_hostname        = "control.javaansehz.cloud"
rancher_admin_password  = "admin"

nodes = {
  1 = {
    name                = "master.javaansehz.cloud"
    address             = "172.22.101.101"
    roles               = ["controlplane", "etcd", "worker"]
  },
  2 = {
    name                = "worker.javaansehz.cloud"
    address             = "172.22.101.102"
    roles               = ["worker"]
  }
}
