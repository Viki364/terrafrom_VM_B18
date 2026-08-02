

resource "azurerm_resource_group" "CMRGS" {
  for_each = var.cvrgs
  name = each.value.RGname
  location = each.value.RGlocation
}
