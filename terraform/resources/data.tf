data "terraform_remote_state" "resources" {
  backend = "azurerm"

  config = {
    storage_account_name = "storageAccountName"
    container_name       = "tfstates"
    resource_group_name  = "resourceGroupName"
    key                  = "resources.tfstate"
  }
}

data "azurerm_resource_group" "existing" {
  name = "resourceGroupName"
}