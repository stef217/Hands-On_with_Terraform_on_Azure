terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      "source" = "hashicorp/azurerm"
      version  = "> 3.43.0"
    }
  }
  cloud {

    organization = "Terraformlearn21"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id            = "9734ed68-621d-47ed-babd-269110dbacb1"
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-227cca48-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage2" {
  source  = "app.terraform.io/Terraformlearn21/securestorage2/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "hristorage28"
}
