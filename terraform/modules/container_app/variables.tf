variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "container_app_environment_id" {
  description = "Container App Environment ID"
  type        = string
}

variable "name" {
  description = "Name of the service"
  type        = string
  default     = "container_app"
}

variable "revision_mode" {
  description = "Deployment mode (Single / Multiple)"
  type        = string
  default     = "Single"
}

variable "allow_insecure_connections" {
  description = "Allow insecure connections"
  type        = bool
  default     = false
}

variable "target_port" {
  description = "Target port"
  type        = number
  default     = 80
}

variable "container_apps" {
  default = [
    {
      name                       = "helloworldapp"
      image                      = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu                        = 0.25
      memory                     = "0.5Gi"
      transport                  = "auto"
      target_port                = 80
      external_enabled           = false
      allow_insecure_connections = false
      secret_name                = "helloworldsecret"
      secret_value               = "helloworldsecretvalue"
    },
    {
      name                       = "helloworldapp2"
      image                      = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu                        = 0.25
      memory                     = "0.5Gi"
      transport                  = "auto"
      target_port                = 80
      external_enabled           = false
      allow_insecure_connections = false
      secret_name                = "helloworldsecret"
      secret_value               = "helloworldsecretvalue"
    },
    {
      name                       = "helloworldapp3"
      image                      = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu                        = 0.25
      memory                     = "0.5Gi"
      transport                  = "auto"
      target_port                = 80
      external_enabled           = false
      allow_insecure_connections = false
      secret_name                = "helloworldsecret"
      secret_value               = "helloworldsecretvalue"
    }
  ]
}

variable "is_latest_version" {
  description = "Is the latest version"
  type        = bool
  default     = true
}

variable "container_registry_server" {
  description = "Container registry server"
  type        = string
}

variable "container_registry_username" {
  description = "Container registry username"
  type        = string
}

variable "container_registry_password" {
  description = "Container registry password"
  type        = string
  sensitive   = true
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