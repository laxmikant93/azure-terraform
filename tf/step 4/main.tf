// https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "app_network1" {
  name                = local.network.name
  location            = local.location
  resource_group_name = azurerm_resource_group.apgroup.name
  address_space       = [local.address[0]]

  subnet {
    name             = "websubnet01"
    address_prefixes = [local.subnet_addresses[0]]
  }

  subnet {
    name             = "appsubnet01"
    address_prefixes = [local.subnet_addresses[1]]
  }
 
}

