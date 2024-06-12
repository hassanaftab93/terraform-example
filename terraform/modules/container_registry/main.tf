resource "azurerm_container_registry" "this" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = var.is_admin_enabled
  public_network_access_enabled = var.is_public_network_access_enabled
  tags                          = var.tags
}