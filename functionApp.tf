data "azurerm_resource_group" "rg-funapp" {
  name     = "function-app"
}

resource "azurerm_storage_account" "funStore" {
  name                     = "linuxfunctionappsa"
  resource_group_name      = data.azurerm_resource_group.rg_funapp.name
  location                 = data.zurerm_resource_group.rg_funapp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "funService" {
  name                = "function-app-service-plan"
  resource_group_name = data.azurerm_resource_group.rg_funapp.name
  location            = data.azurerm_resource_group.rg_funapp.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_function_app" "funapp" {
  name                = "funapp-linux-function-app"
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
      "FUNCTIONS_WORKER_RUNTIME"       = "dotnet" # Or "python", "node", etc.
      "AzureWebJobsStorage"            = azurerm_storage_account.funStore.primary_connection_string
    }
   }
}

