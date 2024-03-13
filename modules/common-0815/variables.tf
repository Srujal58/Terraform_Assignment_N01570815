variable "resource_group_name" {}

variable "location" {}

variable  "common_tags" {}

variable "log_analytics_workspace_name" {
 default = "0815-log-analysis-workspace"
}

variable "recovery_services_vault_name" {
 default = "Vault0815"
}

variable "storage_account_name" {
 default = "0815storageaccnew"
}
