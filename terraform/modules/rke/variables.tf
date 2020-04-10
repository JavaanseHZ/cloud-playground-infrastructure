variable "nodes" {

}

variable "ssh_user" {
  default = "rancher"
}

variable "private_ssh_key_file" {
  default = "../keys/id_rsa_terraform_rancher"
}

variable "environment_name" {

}
