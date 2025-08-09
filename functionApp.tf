data "azurerm_resource_group" "rg-funapp" {
  name     = "${var.resource_group_name}"
}

resource "azurerm_storage_account" "funStore" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = data.azurerm_resource_group.rg_funapp.name
  location                 = data.azurerm_resource_group.rg_funapp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "funService" {
  name                = "${var.service_plan_name}"
  resource_group_name = data.azurerm_resource_group.rg_funapp.name
  location            = data.azurerm_resource_group.rg_funapp.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_function_app" "funapp" {
  name                = "${var.function_app_name}"
  resource_group_name = data.azurerm_resource_group.rg-funapp.name
  location            = data.azurerm_resource_group.rg_funapp.location

  storage_account_name       = azurerm_storage_account.funStore.name
  storage_account_access_key = azurerm_storage_account.funStore.primary_access_key
  service_plan_id            = azurerm_service_plan.funService.id

  site_config {
    application_stack {
	node_version = 18	
    }

    # Use this block to define your application settings
    app_settings = {
      "FUNCTIONS_WORKER_RUNTIME"       = "node" # Or "python", "dotnet", etc.
      "AzureWebJobsStorage"            = azurerm_storage_account.funStore.primary_connection_string
    }
   }
}

