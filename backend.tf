terraform {
  backend "azurerm" {
 # Access key can also be set via `ARM_ACCESS_KEY` environment variable.
    storage_account_name = "funappstorage"
 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "funapp"
 # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"
 # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
