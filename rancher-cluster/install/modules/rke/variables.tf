variable "nodes" {

}

variable "ssh_user" {
  default = "rancher"
}

variable "private_ssh_key_file" {
  default = "../../keys/id_rsa_terraform_rancher"
}

variable "environment_name" {

}

variable "service_ip_range" {
  default = "10.43.0.0/16"
}

variable "pod_ip_range" {
  default = "10.42.0.0/16"
}

variable "cluster_dns_ip" {
  default = "10.43.0.10"
}
