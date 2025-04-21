terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "cicd-rg"
    storage_account_name = "gitauto"
    container_name       = "terraformbackend"
    key                  = "dev.tfstate"
    #use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
# Create a resource group
resource "azurerm_resource_group" "terra-git-action" {
  name     = "terragitaction"
  location = "Canada Central"
}
