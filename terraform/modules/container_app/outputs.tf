output "Latest_Revision_Fqdn" {
  description = "desired_output of the deployed App Service"
  value       = [for app in azurerm_container_app.this : app.latest_revision_fqdn]
}

output "Outbound_Ip_Addresses" {
  description = "Outbound IP Addresses"
  value       = azurerm_container_app.this[*].outbound_ip_addresses
}