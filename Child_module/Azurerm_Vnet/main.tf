

resource "azurerm_virtual_network" "CMvnet" {
    for_each = var.cvvnet
    name = each.value.vnetname
    location = each.value.vnetlocation
    resource_group_name = each.value.RGname
    address_space = each.value.vnetaddressspace
}