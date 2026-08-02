


resource "azurerm_network_interface" "CMNIC" {
    for_each = var.cvvms
  name                = each.value.nicname
  location            = each.value.niclocation
  resource_group_name = each.value.nic_RGname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.DMsubnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.DMpip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "CMVM" {
 for_each = var.cvvms
  name                = each.value.vmname
  resource_group_name = each.value.nic_RGname
  location            = each.value.vmlocation
  size                = each.value.vmsize
  admin_username      = each.value.vmadmin_username
  admin_password = each.value.vmadmin_password
  disable_password_authentication = "false"
  network_interface_ids = [
    azurerm_network_interface.CMNIC[each.key].id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}