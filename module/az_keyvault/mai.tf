resource "azurerm_key_vault" "kv" {

  for_each = var.keyvault

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
   tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = each.value.sku_name

  purge_protection_enabled   = true
  soft_delete_retention_days = 90
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Purge"
    ]
 }
}
resource "azurerm_key_vault_secret" "username" {
  for_each = var.keyvault

  name         = each.value.username
  value        = each.value.admin_username
  key_vault_id = azurerm_key_vault.kv[each.key].id
}

resource "azurerm_key_vault_secret" "password" {

  for_each = var.keyvault

  name         = each.value.password
  value        = each.value.admin_password
  key_vault_id = azurerm_key_vault.kv[each.key].id
}