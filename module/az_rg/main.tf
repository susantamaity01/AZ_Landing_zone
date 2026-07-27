resource "azurerm_resource_group" rg03 {
  for_each = var.resource_group
  name = each.value.name
  location = each.value.location
}