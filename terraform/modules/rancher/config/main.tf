# Provider bootstrap config with alias
provider "rancher2" {
  alias = "bootstrap"
  api_url   = "https://${var.nodes.1.address}"
  bootstrap = true
  insecure = true
}

# Create a new rancher2_bootstrap using bootstrap provider config
resource "rancher2_bootstrap" "admin" {
  provider = rancher2.bootstrap
  password = var.rancher_admin_password
  telemetry = false

}
