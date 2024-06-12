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

variable "tags" {
  type = map(string)
  default = {
    ServiceName    = ""
    Department     = ""
    Environment    = "NonProd"
    SubEnvironment = "NonProdProject"
    SystemName     = ""
  }
}

variable "administrator_login" {
  type        = string
  description = "Administrator login"
  sensitive   = true
}

variable "administrator_login_password" {
  type        = string
  description = "Administrator login password"
  sensitive   = true
}