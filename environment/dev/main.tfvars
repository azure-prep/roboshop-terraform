subnet_id="/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworks/project-setup-network/subnets/default"
image_id="/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Compute/images/devops-practice-image"
zone_name="azdevopsb1.online"
network_security_group_id="/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Network/networkSecurityGroups/project-allow-all-ports"
env = "dev"
databases = {
  mongodb = {
    rgname  = "ukwest"
  },
  rabbitmq = {
    rgname  = "ukwest"
  },
  mysql = {
    rgname  = "ukwest"
  },
  redis = {
    rgname  = "ukwest"
  }
}
application = {
  cart = {
    rgname  = "ukwest"
  },
  catalogue = {
    rgname  = "ukwest"
  },
  user = {
    rgname  = "ukwest"
  },
  payment = {
    rgname  = "ukwest"
  },
  shipping = {
    rgname  = "ukwest"
  },
  frontend = {
    rgname  = "ukwest"
  }
}
rg_name = {
  ukwest = {
    rg_location = "Uk West"
  }
}