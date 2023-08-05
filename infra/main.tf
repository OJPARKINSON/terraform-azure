# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_version = "~> 1.5.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg-webapp" {
  name     = "1-0af74560-playground-sandbox"
  location = "West Europe"
  tags = {
    environment = "dev"
  }
} 

resource "azurerm_static_site" "web-app" {
  name                = "web-app"
  resource_group_name = azurerm_resource_group.rg-webapp.name
  location = azurerm_resource_group.rg-webapp.location 
  sku_size           = "Free"
}
