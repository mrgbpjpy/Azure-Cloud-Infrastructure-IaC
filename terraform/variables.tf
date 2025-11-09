
variable "project_name" {
  description = "A short name used as a prefix for resources"
  type        = string
  default     = "pubcloud"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Deployment environment (dev|test|prod)"
  type        = string
  default     = "dev"
}

variable "docker_image" {
  description = "Container image (e.g., yourdockerhubuser/yourimage:tag)"
  type        = string
  default     = "nginxdemos/hello:plain-text"
}

variable "container_port" {
  description = "Container port exposed by the image"
  type        = number
  default     = 80
}

variable "sku_tier" {
  description = "App Service Plan tier"
  type        = string
  default     = "BASIC"
}

variable "sku_size" {
  description = "App Service Plan size"
  type        = string
  default     = "B1"
}
