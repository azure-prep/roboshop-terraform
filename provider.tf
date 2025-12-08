# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "8378289b-756a-4d87-88be-37638bd44229"
}

provider vault{
  address = "http://vault-int.azdevopsb1.online:8200"
  token   = var.token
}

terraform {
  backend "azurerm" {
  }
}