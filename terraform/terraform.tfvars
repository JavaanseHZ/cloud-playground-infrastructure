environment_name = "rancher"
rancher_hostname = "control"
rancher_version = "v2.3.6"
cert_manager_version = "0.14.0"

servers = {
  1 = {
    name               = "control"
    address            = "172.22.101.100"
    roles              = ["controlplane", "etcd", "worker"]
  },

#  2 = {
#    name               = "master"
#    private_ip_address = "172.22.101.101"
#    port               = 2201
#    roles              = ["controlplane", "etcd", "worker"]
#  },

#  3 = {
#    name               = "slave"
#    private_ip_address = "172.22.101.102"
#    port               = 2200
#    roles              = ["worker"]
#  },
}
