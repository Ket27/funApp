output "function_app_name" {
	value = "azurerm_linux_function_app.funapp.name"
	description = "The name of function app"
}

output "azure_storage_name" {
	value = "azurerm_storage_account.funStore.name"
	description = "The name of the storage account"
}

output "functions_app_default_hostname" {
	value = "azurerm_linux_function_app.funapp.default_hostname"
	description = "The default hostname of the azure functions app"
}
