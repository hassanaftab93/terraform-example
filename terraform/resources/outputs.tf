# Container App Environment

output "container_app_environment_default_domain" {
  value = module.container_app_environment.Default_Domain
}

output "container_app_environment_docker_bridge" {
  value = module.container_app_environment.Docker_Bridge_CIDR
}

output "container_app_environment_environment_id" {
  value = module.container_app_environment.Environment_ID
}

output "container_app_environment_static_ip_address" {
  value = module.container_app_environment.Static_IP_Address
}

# Container Apps

output "container_app_latest_fqdn" {
  value = module.container_app.Latest_Revision_Fqdn
}

output "container_app_outbound_ips" {
  value = module.container_app.Outbound_Ip_Addresses
}

# Container Registry

output "container_registry_id" {
  value = module.container_registry.id
}

output "container_registry_sku" {
  value = module.container_registry.sku
}

output "container_registry_registry_server" {
  value = module.container_registry.registry_server
}

output "container_registry_admin_enabled" {
  value = module.container_registry.admin_enabled
}

output "container_registry_admin_username" {
  value     = module.container_registry.admin_username
  sensitive = true
}

output "container_registry_admin_password" {
  value     = module.container_registry.admin_password
  sensitive = true
}