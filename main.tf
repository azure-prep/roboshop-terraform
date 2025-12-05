module "resource-rg" {
  for_each = var.rg_name
  source = "./modules/resource-group"
  env    = var.env
  location = var.rg_name["ukwest"].rg_location
  name  = "roboshop-${each.key}-${env}"
}

# module "databases" {
#   for_each            = var.databases
#   source              = "modules/vm"
#   component           = each.key
#   image_id            = var.image_id
#   location            = module.resource-rg[each.key["ukwest"]].rg_location
#   resource_group_name = module.resource-rg[each.key["ukwest"]].rg_name
#   subnet_id           = var.subnet_id
#   zone_name           = var.zone_name
#   network_security_group_id = var.network_security_group_id
# }
#
# module "application" {
#   for_each    = var.application
#   depends_on  = [module.databases]
#   source      = "modules/vm"
#   component           = each.key
#   image_id            = var.image_id
#   location            = module.resource-rg[each.key["ukwest"]].rg_location
#   resource_group_name = var.resource_group_name
#   subnet_id           = var.subnet_id
#   zone_name           = var.zone_name
#   network_security_group_id = var.network_security_group_id
# }

