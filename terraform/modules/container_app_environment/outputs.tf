output "Default_Domain" {
  description = "Default Domain"
  value       = azurerm_container_app_environment.this.default_domain
}

output "Static_IP_Address" {
  description = "Static IP Address"
  value       = azurerm_container_app_environment.this.static_ip_address
}

output "Docker_Bridge_CIDR" {
  description = "Docker Bridge CIDR"
  value       = azurerm_container_app_environment.this.docker_bridge_cidr
}

output "Environment_ID" {
  description = "Environment ID"
  value       = azurerm_container_app_environment.this.id
}