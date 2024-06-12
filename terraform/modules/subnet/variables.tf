variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "name" {
  description = "Name of the security group"
  type        = string
  default     = "AcceptanceSecurityGroup"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address prefixes of the subnet"
  type        = list(string)
}

variable "delegation_name" {
  description = "Name of the delegation"
  type        = string
}

variable "service_delegation_name" {
  description = "Name of the service delegation"
  type        = string
}

variable "service_delegation_actions" {
  description = "Actions of the service delegation"
  type        = list(string)
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "service_endpoints" {
  description = "Service endpoints of the subnet"
  type        = list(string)
}