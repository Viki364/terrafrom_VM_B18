module "MRGS" {
  source = "../../Child_module/Azurerm_Resource_Group"
  cvrgs  = var.vrgs
}


module "MVNET" {
  depends_on = [module.MRGS]
  source     = "../../Child_module/Azurerm_Vnet"
  cvvnet     = var.vvnet
}

module "Msubnet" {
  depends_on = [module.MVNET]
  source     = "../../Child_module/Azurerm_Subnet"
  cvsubnet   = var.vsubnet
}


module "MPIP" {

  depends_on = [module.MRGS]
  source     = "../../Child_module/Azurerm_PIP"
  cvpip      = var.vpip
}


module "MVMS" {

  depends_on = [module.Msubnet]
  source     = "../../Child_module/Azurerm_VM"
  cvvms      = var.vvms

}