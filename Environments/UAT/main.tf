module "for_resource_group" {
  source         = "../../module/az_rg"
  resource_group = var.resource_group
}
module "for_vnet" {
  depends_on = [module.for_resource_group]
  source     = "../../module/az_vnet"
  vnet       = var.vnet
}
module "for_subnet" {
  depends_on = [module.for_vnet]
  source     = "../../module/az_subnet"
  subnet     = var.subnet
}
module "for_public_ip" {
  depends_on = [module.for_resource_group]
  source     = "../../module/az_public_ip"
  public_ip  = var.public_ip
}
module "for_bastion" {
  depends_on = [module.for_subnet, module.for_public_ip, module.for_resource_group]
  source     = "../../module/az_bastion"
  bastion    = var.bastion
}
module "for_nic" {
  depends_on             = [module.for_subnet, module.for_public_ip, module.for_resource_group]
  source                 = "../../module/az_nic"
  network_interface_card = var.network_interface_card
}
module "for_vm" {
  depends_on = [module.for_resource_group, module.for_nic, module.for_keyvalt]
  source     = "../../module/az_vm"
  vm         = var.vm
}
module "for_keyvalt" {
  depends_on = [ module.for_resource_group ]
  source   = "../../module/az_keyvault"
  keyvault = var.keyvault
}