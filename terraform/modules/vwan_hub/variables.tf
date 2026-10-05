variable "location" {
  type        = string
  description = "Azure region for the hub deployment."
}

variable "environment" {
  type        = string
  description = "Deployment environment name."
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group where the Hub will reside."
}

variable "vwan_id" {
  type        = string
  description = "ID of the parent Virtual WAN."
}

variable "address_prefix" {
  type        = string
  description = "Address prefix CIDR for the Virtual WAN Hub."
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default     = {}
}
