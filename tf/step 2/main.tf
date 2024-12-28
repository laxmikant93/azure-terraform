// More information on the Azure Terraform provider is available in the below link
// https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

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

resource "azurerm_resource_group" "mygrp" {
  name     = "my-grp"
  location = "North Europe"
}

resource "azurerm_storage_account" "appstore40000907821" {
  name                     = "appstore40000907821"
  resource_group_name      = "my-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"  
}

resource "azurerm_storage_container" "scripts" {
  name                  = "photo"
  storage_account_name  = "appstore40000907821"
}
resource "azurerm_storage_blob" "cr7" {
  name                   = "cristiano"
  storage_account_name   = "appstore40000907821"
  storage_container_name = "photo"
  type                   = "Block"
  source                 = "cr7.jpeg"
  }