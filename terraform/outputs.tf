output "resource_group_name" {
  value       = module.vwan_core.resource_group_name
  description = "The name of the main Virtual WAN Resource Group."
}

output "virtual_wan_id" {
  value       = module.vwan_core.vwan_id
  description = "The Resource ID of the global Virtual WAN."
}

output "eastus_hub_id" {
  value       = module.hub_eastus.hub_id
  description = "The Resource ID of the East US Virtual WAN Hub."
}

output "westeurope_hub_id" {
  value       = module.hub_westeurope.hub_id
  description = "The Resource ID of the West Europe Virtual WAN Hub."
}

output "eastus_firewall_ips" {
  value       = module.secure_firewall_eastus.public_ip_addresses
  description = "Public IP addresses for the East US Secure Hub Firewall."
}

output "westeurope_firewall_ips" {
  value       = module.secure_firewall_westeurope.public_ip_addresses
  description = "Public IP addresses for the West Europe Secure Hub Firewall."
}
