module "function_app" {
  source                  = "../../modules/function_app"
  app_service_plan_name   = "test-app-plan"
  resource_group_name     = module.resource_group.rg_name
  location               = "East US"
  storage_account_name    = module.storage_account.storage_account_name
  storage_account_access_key = module.storage_account.storage_account_name

  functions = {
    "function1" = {
      function_app_name = "test-function-app1"
      app_settings      = { "WEBSITE_RUN_FROM_PACKAGE" = "1" }
    }
    "function2" = {
      function_app_name = "test-function-app2"
      app_settings      = { "FUNCTIONS_WORKER_RUNTIME" = "python" }
    }
  }
}
