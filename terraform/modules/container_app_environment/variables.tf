variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "name" {
  description = "Name of the app environment"
  type        = string
  default     = "container_app_environment"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to deploy the App Service"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID"
  type        = string
}

variable "infrastructure_subnet_id" {
  description = "Infrastructure Subnet ID"
  type        = string
}

variable "internal_load_balancer_enabled" {
  description = "Internal Load Balancer Enabled"
  type        = bool
}

variable "workload_profile_name" {
  description = "Workload Profile Name"
  type        = string
  default     = "Consumption"
}

variable "workload_profile_type" {
  description = "Workload Profile Type"
  type        = string
  default     = "Consumption"
}

variable "tags" {
  type = map(string)
  default = {
    ServiceName    = ""
    Department     = ""
    Environment    = ""
    SubEnvironment = ""
    SystemName     = ""
  }
}