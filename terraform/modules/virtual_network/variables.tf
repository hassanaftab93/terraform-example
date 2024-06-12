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

variable "location" {
  description = "Location of the security group"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
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