resource "azurerm_resource_group" "roboshop-rg" {
  name     = var.rg_name
  location = var.rg_location
}

output "rg_name" {
  value = azurerm_resource_group.roboshop-rg.name
}

output "rg_location" {
  value = azurerm_resource_group.roboshop-rg.location
}