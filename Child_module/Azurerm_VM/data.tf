
data "azurerm_subnet" "DMsubnet" {
    for_each = var.cvvms
  name                 = each.value.nic_subnet_name
  virtual_network_name = each.value.nic_vnet_name
  resource_group_name  = each.value.nic_RGname
}


data "azurerm_public_ip" "DMpip" {
    for_each = var.cvvms
  name                = each.value.nic_pip_name
  resource_group_name = each.value.nic_RGname
}