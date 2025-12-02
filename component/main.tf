terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
  }
}
resource "azurerm_public_ip" "public-ip" {
  name                = "${var.component}-public-ip"
  location              = var.location
  resource_group_name   = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "privateip" {
  name                = "${var.component}-dev"
  location              = var.location
  resource_group_name   = var.resource_group_name
  ip_configuration {
    name                          = "${var.component}-dev"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.component}-dev"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.privateip.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id                = var.image_id
  }
  storage_os_disk {
    name              = "${var.component}-dev"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.component}-dev"
    admin_username = "azuser"
    admin_password = "Devops@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "null_resource" "ansible" {
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx"
    ]
    connection {
      type     = "ssh"
      user     = "azuser"
      password = "Devops@12345"
      host     =  azurerm_network_interface.privateip.private_ip_address
    }
  }
}

resource "azurerm_dns_a_record" "example" {
  name                = "${var.component}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_network_interface.privateip.private_ip_address]
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = var.subnet_id
  network_security_group_id = var.network_security_group_id
}