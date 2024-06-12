variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "name" {
  description = "Name of the resource"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resource"
  type        = string
}

variable "sku" {
  description = "(Required) The SKU name of the container registry. Possible values are Basic, Standard and Premium."
  type        = string
}

variable "is_admin_enabled" {
  description = "(Optional) Whether or not admin user is enabled. Only valid when creating a Basic or Standard container registry."
  type        = bool
  default     = false
}

variable "is_public_network_access_enabled" {
  description = "(Optional) Whether or not public network access is enabled. Default value is false."
  type        = bool
  default     = false
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