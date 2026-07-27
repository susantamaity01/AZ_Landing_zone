resource "azurerm_network_interface" "example" {
  for_each            = var.network_interface_card
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.pip_name
    subnet_id                     = data.azurerm_subnet.frontend-subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    # public_ip_address_id          = data.azurerm_public_ip.fronted-pip[each.key].id
  }
}