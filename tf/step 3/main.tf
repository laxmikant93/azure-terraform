terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "72efd94e-fc50-4469-be95-5d93d039eabf"
}

resource "azurerm_resource_group" "appgroup" {
  name     = "app-group"
  location = "North Europe"
}

// https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "app_network" {
  name                = "app-network"
  location            = "North Europe"
  resource_group_name = azurerm_resource_group.appgroup.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = "websubnet01"
    address_prefixes = ["10.0.0.0/24"]
  }

  subnet {
    name             = "appsubnet01"
    address_prefixes = ["10.0.1.0/24"]
  }
 
}

