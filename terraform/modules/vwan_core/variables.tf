variable "project_prefix" {
  type        = string
  description = "Prefix used for naming resources."
}

variable "environment" {
  type        = string
  description = "Target deployment environment."
}

variable "primary_location" {
  type        = string
  description = "Primary location for the Virtual WAN resource group."
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default     = {}
}
