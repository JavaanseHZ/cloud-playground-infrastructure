# Rancher cluster with Terraform
## Prerequisites
Vagrant and VirtualBox are used for a Test setup.
The provisioning works just as well with other setups.  
### Install Vagrant (optional)
https://www.vagrantup.com/downloads.html
### Install VirtualBox (optional)
https://www.virtualbox.org/wiki/Linux_Downloads
### Install Terraform
https://learn.hashicorp.com/terraform/getting-started/install.html
### Install Rancher2 Terraform provider
https://github.com/terraform-providers/terraform-provider-rancher2
### Install Helm Terraform Provider
https://github.com/terraform-providers/terraform-provider-helm
### Install kubectl
https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux

## Setup Base Nodes with Vagrant (optional)
```console
cd vagrant && vagrant up
```
## Provision Rancher with Terraform
