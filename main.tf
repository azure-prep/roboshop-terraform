module "component" {
  source = "./component"
  component           = "frontend"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "component" {
  source = "./component"
  component           = "mongodb"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "component" {
  source = "./component"
  component           = "mysql"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "component" {
  source = "./component"
  component           = "redis"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "component" {
  source = "./component"
  component           = "rabbitmq"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "component" {
  source = "./component"
  component           = "cart"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "component" {
  source = "./component"
  component           = "catalogue"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "component" {
  source = "./component"
  component           = "payment"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "component" {
  source = "./component"
  component           = "shipping"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "component" {
  source = "./component"
  component           = "user"
  image_id            = var.image_id
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  zone_name           = var.zone_name
  network_security_group_id = var.network_security_group_id
}