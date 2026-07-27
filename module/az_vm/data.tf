data "azurerm_network_interface" "nic" {
  for_each = var.vm
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "kv" {
  for_each = var.vm
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each = var.vm
  name         = "uservalt"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.vm
  name         = "passwordvalt"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}