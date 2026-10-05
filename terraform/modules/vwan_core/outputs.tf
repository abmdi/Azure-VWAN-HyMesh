output "vwan_id" {
  value       = azurerm_virtual_wan.vwan.id
  description = "The ID of the Virtual WAN resource."
}

output "vwan_name" {
  value       = azurerm_virtual_wan.vwan.name
  description = "The name of the Virtual WAN resource."
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg_vwan.name
  description = "The name of the Virtual WAN Resource Group."
}
