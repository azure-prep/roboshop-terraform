resource "azurerm_resource_group" "roboshop-rg" {
  name     = var.name
  location = var.location
}

output "rg_name" {
  value = azurerm_resource_group.roboshop-rg.name
}

output "rg_location" {
  value = azurerm_resource_group.roboshop-rg.location
}