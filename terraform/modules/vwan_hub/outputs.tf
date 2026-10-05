output "hub_id" {
  value       = azurerm_virtual_hub.hub.id
  description = "The ID of the Virtual WAN Hub."
}

output "hub_name" {
  value       = azurerm_virtual_hub.hub.name
  description = "The name of the Virtual WAN Hub."
}

output "er_gateway_id" {
  value       = azurerm_express_route_gateway.er_gw.id
  description = "The ID of the ExpressRoute Gateway."
}

output "vpn_gateway_id" {
  value       = azurerm_vpn_gateway.s2s_gw.id
  description = "The ID of the S2S VPN Gateway."
}
