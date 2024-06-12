module "network_security_group" {
  source              = "../modules/network_security_group"
  name                = "project${var.environment}nsg"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name

  rules = [
    {
      name                       = "nsg-rule-1"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "nsg-rule-2"
      priority                   = 101
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
  depends_on = [data.azurerm_resource_group.existing]
  tags       = merge(var.tags)
}

module "virtual_network" {
  source              = "../modules/virtual_network"
  name                = "project${var.environment}vnet"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  address_space       = ["10.0.0.0/16"]
  depends_on          = [data.azurerm_resource_group.existing, module.network_security_group.this]
  tags                = merge(var.tags)
}

module "subnet" {
  source                     = "../modules/subnet"
  name                       = "project${var.environment}subnet"
  resource_group_name        = data.azurerm_resource_group.existing.name
  virtual_network_name       = module.virtual_network.virtual_network_name
  subnet_address_prefix      = ["10.0.1.0/24"]
  service_endpoints          = ["Microsoft.Storage", "Microsoft.Web"]
  delegation_name            = "delegation"
  service_delegation_name    = "Microsoft.App/environments"
  service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
  depends_on                 = [data.azurerm_resource_group.existing, module.virtual_network.this, module.network_security_group.this]
}

module "container_app_environment" {
  source                         = "../modules/container_app_environment"
  resource_group_name            = data.azurerm_resource_group.existing.name
  location                       = data.azurerm_resource_group.existing.location
  name                           = "project-${var.environment}-cntr-env"
  log_analytics_workspace_id     = module.log_analytics_workspace.log_analytics_workspace_id
  infrastructure_subnet_id       = module.subnet.subnet_id
  internal_load_balancer_enabled = false
  depends_on                     = [data.azurerm_resource_group.existing, module.log_analytics_workspace.this, module.subnet.this]
  tags                           = merge(var.tags)
}

module "container_registry" {
  source                           = "../modules/container_registry"
  resource_group_name              = data.azurerm_resource_group.existing.name
  location                         = data.azurerm_resource_group.existing.location
  name                             = "project${var.environment}cr"
  sku                              = "Standard"
  is_admin_enabled                 = true
  is_public_network_access_enabled = true
  depends_on                       = [data.azurerm_resource_group.existing, module.key_vault.this]
  tags                             = merge(var.tags)
}

module "container_app" {
  source                       = "../modules/container_app"
  resource_group_name          = data.azurerm_resource_group.existing.name
  container_app_environment_id = module.container_app_environment.Environment_ID
  container_registry_server    = "$(acrServer)"
  container_registry_username  = "$(acrUsername)"
  container_registry_password  = "$(acrPassword)"
  container_apps = [
    {
      name                       = "containerapp1-${var.environment}"
      image                      = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu                        = 0.25
      memory                     = "0.5Gi"
      target_port                = 8080
      transport                  = "http2"
      external_enabled           = true
      allow_insecure_connections = false
      secret_name                = "$(containerAppSecretKey)"
      secret_value               = "$(containerAppSecretValue)"
    },
    {
      name                       = "containerapp2-${var.environment}"
      image                      = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu                        = 0.25
      memory                     = "0.5Gi"
      target_port                = 8080
      transport                  = "auto"
      external_enabled           = true
      allow_insecure_connections = false
      secret_name                = "$(containerAppSecretKey)"
      secret_value               = "$(containerAppSecretValue)"
    }
  ]
  depends_on = [data.azurerm_resource_group.existing, module.container_app_environment.this, module.container_registry.this, module.key_vault_secret_registry_username.this, module.key_vault_secret_registry_password.this]
  tags       = merge(var.tags)
}

module "subnet_nsg_association" {
  source                    = "../modules/subnet_network_security_group_association"
  subnet_id                 = module.subnet.subnet_id
  network_security_group_id = module.network_security_group.id
  depends_on                = [data.azurerm_resource_group.existing, module.subnet.this, module.network_security_group.this]
}