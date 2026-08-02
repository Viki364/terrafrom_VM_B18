
vrgs = {
  rgs1 = {
    RGname     = "L1rgs"
    RGlocation = "centralindia"
  }

  rgs2 = {
    RGname     = "L2rgs"
    RGlocation = "eastus"
  }

  rgs2 = {
    RGname     = "Branch_RG"
    RGlocation = "eastus"
  }

}

vvnet = {
  vnet1 = {
    vnetname         = "L1vnet"
    vnetlocation     = "centralindia"
    RGname           = "L1rgs"
    vnetaddressspace = ["10.10.0.0/16"]
  }
}

vsubnet = {
  subnet1 = {
    subnetname       = "L1FEsubnet"
    vnetname         = "L1vnet"
    RGname           = "L1rgs"
    address_prefixes = ["10.10.10.0/24"]
  }

  subnet2 = {
    subnetname       = "L1BEsubnet"
    vnetname         = "L1vnet"
    RGname           = "L1rgs"
    address_prefixes = ["10.10.1.0/24"]
  }
}


vpip = {
  pip1 = {
    pipname           = "LFEpip"
    RGname            = "L1rgs"
    piplocation       = "centralindia"
    allocation_method = "Static"
  }

  pip2 = {
    pipname           = "LBEpip"
    RGname            = "L1rgs"
    piplocation       = "centralindia"
    allocation_method = "Static"
  }
}


vvms = {
  vms1 = {
    vmname              = "LFEvm"
    vmlocation          = "centralindia"
    vmsize              = "Standard_F2"
    vmadmin_username    = "adminfeuser"
    vmadmin_password    = "Shiv750370@"
    nicname             = "LFEnic"
    niclocation         = "centralindia"
    resource_group_name = "L1rgs"
    nic_subnet_name     = "L1FEsubnet"
    nic_vnet_name       = "L1vnet"
    nic_RGname          = "L1rgs"
    nic_pip_name        = "LFEpip"
  }

  vms2 = {
    vmname              = "LBEvm"
    vmlocation          = "centralindia"
    vmsize              = "Standard_F2"
    vmadmin_username    = "adminbeuser"
    vmadmin_password    = "Shiv750370@"
    nicname             = "LBEnic"
    niclocation         = "centralindia"
    resource_group_name = "L1rgs"
    nic_subnet_name     = "L1BEsubnet"
    nic_vnet_name       = "L1vnet"
    nic_RGname          = "L1rgs"
    nic_pip_name        = "LBEpip"
  }
}