terraform {
  backend "azurerm" {
    storage_account_name = "storageAccountName"
    container_name       = "tfstates"
    resource_group_name  = "resourceGroupName"
    key                  = "resources.tfstate"
  }
}