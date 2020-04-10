variable "nodes" {

}
variable "private_ips" {

}
variable "ssh_user" {
  default = "rancher"
}
variable "private_ssh_key_file" {
  default = "${path.root}/../keys/id_rsa_rancher"
}
variable "environment_name" {

}
