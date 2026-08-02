

resource "azurerm_subnet" "CMsubnet" {
    for_each = var.cvsubnet
    name = each.value.subnetname
    resource_group_name = each.value.RGname
    virtual_network_name = each.value.vnetname
    address_prefixes = each.value.address_prefixes
}