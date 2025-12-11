module "resource-rg" {
  for_each = var.rg_name
  source = "./modules/resource-group"
  env    = var.env
  location = each.value["rg_location"]
  name  = "roboshop-${each.key}-${var.env}"
}


# module "databases" {
#   for_each            = var.databases
#   source              = "./modules/vm"
#   component           = each.key
#   image_id            = var.image_id
#   location            = module.resource-rg[each.value["rgname"]].rg_location
#   resource_group_name = module.resource-rg[each.value["rgname"]].rg_name
#   subnet_id           = var.subnet_id
#   zone_name           = var.zone_name
#   network_security_group_id = var.network_security_group_id
#   token = var.token
#   spot = "1"
#   env = var.env
#   type = "db"
# }
#
# module "application" {
#   for_each    = var.application
#   depends_on  = [module.databases]
#   source      = "./modules/vm"
#   component           = each.key
#   image_id            = var.image_id
#   location            = module.resource-rg[each.value["rgname"]].rg_location
#   resource_group_name = module.resource-rg[each.value["rgname"]].rg_name
#   subnet_id           = var.subnet_id
#   zone_name           = var.zone_name
#   network_security_group_id = var.network_security_group_id
#   token = var.token
#   spot = "1"
#   env = var.env
#   type = "app"
# }

module "aks" {
  for_each    = var.aks
  source      = "./modules/aks"
  component           = each.key
  location            = module.resource-rg[each.value["rgname"]].rg_location
  resource_group_name = module.resource-rg[each.value["rgname"]].rg_name
}

