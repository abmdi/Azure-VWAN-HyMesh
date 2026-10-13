variable "vnet_name" {
  type        = string
  description = "Name of the Spoke Virtual Network."
}

variable "location" {
  type        = string
  description = "Azure region for the VNet."
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group where the VNet will be created."
}

variable "address_space" {
  type        = list(string)
  description = "CIDR block address space for the VNet."
}

variable "virtual_hub_id" {
  type        = string
  description = "ID of the Virtual WAN Hub to connect to."
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default     = {}
}
