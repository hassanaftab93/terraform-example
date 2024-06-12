output "registry_server" {
  description = "Registry server"
  value       = azurerm_container_registry.this.login_server
}

output "admin_username" {
  description = "Registry admin username"
  value       = azurerm_container_registry.this.admin_username
}

output "admin_password" {
  description = "Registry admin password"
  value       = azurerm_container_registry.this.admin_password
}

output "id" {
  description = "Registry ID"
  value       = azurerm_container_registry.this.id
}

output "admin_enabled" {
  description = "Registry admin enabled"
  value       = azurerm_container_registry.this.admin_enabled
}

output "sku" {
  description = "Registry SKU"
  value       = azurerm_container_registry.this.sku
}