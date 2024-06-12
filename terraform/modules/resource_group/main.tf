resource "azurerm_resource_group" "this" {
  name     = "rg-${var.project_name}_${var.tags["Environment"]}-${var.environment}"
  location = var.location
  tags     = var.tags
}