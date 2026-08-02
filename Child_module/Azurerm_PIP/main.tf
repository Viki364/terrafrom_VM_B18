

resource "azurerm_public_ip" "CMPIP" {
 
    for_each = var.cvpip
  name                = each.value.pipname
  resource_group_name = each.value.RGname
  location            = each.value.piplocation
  allocation_method   = each.value.allocation_method

}