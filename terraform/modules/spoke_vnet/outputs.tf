output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Spoke Virtual Network."
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the Spoke Virtual Network."
}

output "connection_id" {
  value       = azurerm_virtual_hub_connection.vnet_connection.id
  description = "The ID of the Virtual Hub Connection."
}
