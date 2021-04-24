
resource "azurerm_resource_group" "loadbalancer" {
  name     = "A-lb"
  location = "canadacentral"
}
module "Amin-lb" {
  source              = "Azure/loadbalancer/azurerm"
  resource_group_name = azurerm_resource_group.aminlb.name
  prefix              = "terraform-test"

  remote_port = {
    ssh = ["Tcp", "22"]
  }

  lb_port = {
    http = ["80", "Tcp", "80"]
  }

  lb_probe = {
    http = ["Tcp", "80", ""]
  }

  depends_on = [azurerm_resource_group.aminlb]
}