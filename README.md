# Rancher cluster with Terraform
## Prerequisites
Vagrant and VirtualBox are used for a Test setup.
The provisioning works just as well other setups.  
### Install Vagrant (optional)
https://www.vagrantup.com/downloads.html
### Install VirtualBox (optional)
https://www.virtualbox.org/wiki/Linux_Downloads
### Install Terraform
https://learn.hashicorp.com/terraform/getting-started/install.html
### Install Rancher2 Terraform provider
https://github.com/terraform-providers/terraform-provider-rancher2
## Setup Base Nodes with Vagrant (optional)
```console
cd vagrant && vagrant up
```
## Provision Rancher with Terraform
