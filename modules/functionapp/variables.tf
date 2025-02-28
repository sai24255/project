variable "app_service_plan_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "storage_account_name" {}
variable "storage_account_access_key" {}

variable "functions" {
  type = map(object({
    function_app_name = string
    app_settings      = map(string)
  }))
}
