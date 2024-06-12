variable "location" {
  description = "Azure region to deploy the resource group"
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

variable "region_short" {
  type        = string
  description = "Short name of region used in project"
}

variable "region_name" {
  type        = string
  description = "Long name of region used in project"
}

variable "project_name" {
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}