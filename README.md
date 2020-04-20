# Rancher cluster with Terraform
## Prerequisites
Vagrant and VirtualBox are used for a Test setup.
The provisioning works just as well with other setups.  
### Install Vagrant
https://www.vagrantup.com/downloads.html
### Install Ansible
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
### Install VirtualBox
https://www.virtualbox.org/wiki/Linux_Downloads
### Install Terraform
https://learn.hashicorp.com/terraform/getting-started/install.html
### Install Rancher2 Terraform provider
https://github.com/terraform-providers/terraform-provider-rancher2
### Install Helm Terraform Provider
https://github.com/terraform-providers/terraform-provider-helm
### Install kubectl
https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux

## Setup Base Nodes with Vagrant
```console
cd vm-nodes && vagrant up
```
## Setup Support infrstructure
```console
cd support-infrastructure && docker-compose up -d
```
## Provision Rancher with Terraform
```console
cd rancher-cluster && terraform apply
```
## Provision Dev-Cluster with Terraform & Rancher
```console
cd dev-cluster && terraform apply
```
## Build & Push Demo Application Docker Image
```console
cd demo-service && ./gradlew dockerPushImage
```
## Deploy Demo Application
### Simple
```console
cd demo-service && kubectl --kubeconfig ../dev-cluster/rke_data/kube_config_devcloud.javaansehz.cloud.yml -n simple-ns apply -f k8s/simple.yaml
```
#### Test
```console
curl devcloud
```
### Alive
```console
cd demo-service && kubectl --kubeconfig ../dev-cluster/rke_data/kube_config_devcloud.javaansehz.cloud.yml -n alive-ns apply -f k8s/alive.yaml
```
### Autoscaling
```console
cd demo-service && kubectl --kubeconfig ../dev-cluster/rke_data/kube_config_devcloud.javaansehz.cloud.yml -n autoscaling-ns apply -f k8s/autoscaling.yaml
```
