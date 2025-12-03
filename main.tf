module "databases" {
  for_each = var.databases
  source = "./component"
  component           = each.key
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "application" {
  for_each = var.application
  depends_on = [module.databases]
  source = "./component"
  component           = each.key
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}