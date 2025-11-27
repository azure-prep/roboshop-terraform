# Configure the Microsoft Azure Provider
provider "azurerm" {
features {}
        subscription_id = "8378289b-756a-4d87-88be-37638bd44229"
}

resource "azurerm_public_ip" "frontend-public-ip" {
  name                = "frontend-public-ip"
  location              = "UK West"
  resource_group_name   = "rg1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "frontend-dev" {
  name                = "frontend-dev"
  location              = "UK West"
  resource_group_name   = "rg1"
  ip_configuration {
    name                          = "frontend-dev"
    subnet_id                     = "/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworks/project-setup-network/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend-public-ip.id
  }
}

resource "azurerm_virtual_machine" "frontend-dev" {
  name                  = "frontend-dev"
  location              = "UK West"
  resource_group_name   = "rg1"
  network_interface_ids = [azurerm_network_interface.frontend-dev.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id                = "/subscriptions/8378289b-756a-4d87-88be-37638bd44229/resourceGroups/rg1/providers/Microsoft.Compute/images/devops-practice-image"
  }
  storage_os_disk {
    name              = "frontend-dev"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "frontend-dev"
    admin_username = "azuser"
    admin_password = "Devops@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "example" {
  name                = "frontend-dev"
  zone_name           = "azdevopsb1.online"
  resource_group_name = "rg1"
  ttl                 = 300
  records             = [azurerm_network_interface.frontend-dev.private_ip_address]
}