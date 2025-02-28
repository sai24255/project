resource "azurerm_service_plan" "app_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location           = var.location
  os_type            = "Linux"
  sku_name           = "B1"
}

resource "azurerm_function_app" "function" {
  for_each                  = var.functions

  name                      = each.value.function_app_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  storage_account_name      = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  service_plan_id           = azurerm_service_plan.app_plan.id
  app_settings              = each.value.app_settings
}
