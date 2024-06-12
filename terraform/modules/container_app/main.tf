resource "azurerm_container_app" "this" {
  count                        = length(var.container_apps)
  name                         = var.container_apps[count.index].name
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = var.revision_mode

  ingress {
    allow_insecure_connections = var.container_apps[count.index].allow_insecure_connections
    external_enabled           = var.container_apps[count.index].external_enabled
    target_port                = var.container_apps[count.index].target_port
    transport                  = var.container_apps[count.index].transport
    traffic_weight {
      latest_revision = var.is_latest_version
      percentage      = 100
    }
  }

  secret {
    name  = var.container_apps[count.index].secret_name
    value = var.container_apps[count.index].secret_value
  }

  registry {
    server               = var.container_registry_server
    username             = var.container_registry_username
    password_secret_name = var.container_apps[count.index].secret_name
  }

  template {
    container {
      name   = var.container_apps[count.index].name
      image  = var.container_apps[count.index].image
      cpu    = var.container_apps[count.index].cpu
      memory = var.container_apps[count.index].memory
    }
  }
  tags = var.tags
}