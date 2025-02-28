output "function_app_names" {
  value = { for k, v in azurerm_function_app.function : k => v.name }
}
