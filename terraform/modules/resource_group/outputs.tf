output "name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.this.name
}

output "location" {
  description = "Location of the created resource group"
  value       = azurerm_resource_group.this.location
}

output "id" {
  description = "ID of the created resource group"
  value       = azurerm_resource_group.this.id
}