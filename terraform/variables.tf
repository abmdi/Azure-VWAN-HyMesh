variable "project_prefix" {
  type        = string
  default     = "ent-net"
  description = "Prefix appended to all Azure resources for standard naming conventions."
}

variable "environment" {
  type        = string
  default     = "prod"
  description = "Deployment environment (e.g. prod, stage, dev)."
}

variable "primary_location" {
  type        = string
  default     = "eastus"
  description = "Primary Azure region for the main Virtual WAN Hub."
}

variable "secondary_location" {
  type        = string
  default     = "westeurope"
  description = "Secondary Azure region for the redundant Virtual WAN Hub."
}

variable "vwan_hubs_config" {
  type = map(object({
    location       = string
    address_prefix = string
    sku            = string
  }))
  description = "Configuration parameters for multi-region Virtual WAN hubs."
  default = {
    hub_primary = {
      location       = "eastus"
      address_prefix = "10.100.0.0/23"
      sku            = "Standard"
    },
    hub_secondary = {
      location       = "westeurope"
      address_prefix = "10.102.0.0/23"
      sku            = "Standard"
    }
  }
}

variable "onprem_bgp_asn" {
  type        = number
  default     = 65001
  description = "BGP Autonomous System Number (ASN) of the On-Premises Core Data Center."
}

variable "common_tags" {
  type        = map(string)
  description = "Standard tags applied to all provisioned infrastructure resources."
  default = {
    ManagedBy    = "Terraform"
    Framework    = "Azure Cloud Adoption Framework"
    Architecture = "Azure-VWAN-HyMesh"
    CostCenter   = "Core-IT-Networking"
  }
}
