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

resource "azurerm_resource_group" "apgroup" {
  name     = "ap-group"
  location = local.location
}

