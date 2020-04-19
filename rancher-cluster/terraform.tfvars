environment_name        = "control"
rancher_hostname        = "control.javaansehz.cloud"
cert_manager_version    = "0.12.0"
rancher_version         = "v2.3.6"
rancher_admin_password  = "admin"

nodes = {
  1 = {
    name                = "control.javaansehz.cloud"
    address             = "172.22.101.100"
    roles               = ["controlplane", "etcd", "worker"]
  }
}
