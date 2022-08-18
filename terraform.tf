terraform {

  required_version = ">= 0.13"
  
  required_providers {
    azurerm = {
      version = "2.49.0"
    }
  }

     backend "azurerm" {
        resource_group_name  = "terraform-backend-rg"
        storage_account_name = "terraformbackendst001"
        container_name       = "tf-state"
        key                  = "tfstate.infrastructure"
        subscription_id      = "xxxxxxxxxxxxxxxxxxxxxxx"
    }
}
