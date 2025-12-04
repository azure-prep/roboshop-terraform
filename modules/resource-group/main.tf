resource "azurerm_resource_group" "roboshop-rg" {
  name     = "roboshop-${var.env}"
  location = var.location
}