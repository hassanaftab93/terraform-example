resource "azurerm_container_app_environment" "this" {
  name                           = var.name
  location                       = var.location
  resource_group_name            = var.resource_group_name
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  infrastructure_subnet_id       = var.infrastructure_subnet_id
  internal_load_balancer_enabled = var.internal_load_balancer_enabled

  workload_profile {
    name                  = var.workload_profile_name
    workload_profile_type = var.workload_profile_type
  }

  tags = var.tags
}