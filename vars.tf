variable "image_id" {}
variable "location" {}
variable resource_group_name {}
variable zone_name {}
variable "subnet_id" {}
variable "network_security_group_id" {
}
variable "env" {}

variable "databases" {
  default = {
    mongodb = {},
    rabbitmq = {},
    mysql = {},
    redis = {}
  }
}

variable "application" {
  default = {
    cart = {},
    catalogue = {},
    user = {},
    payment = {},
    shipping = {}
  }
}