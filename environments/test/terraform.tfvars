app_service_plan_name = "test-app-plan"
location = "East US"
resource_group_name = "test-rg"
storage_account_name = "teststorageaccount"
storage_account_access_key = "tfstate"

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
