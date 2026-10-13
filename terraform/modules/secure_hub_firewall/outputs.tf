output "firewall_id" {
  value       = azurerm_firewall.hub_fw.id
  description = "The ID of the Azure Firewall."
}

output "firewall_policy_id" {
  value       = azurerm_firewall_policy.fw_policy.id
  description = "The ID of the Firewall Policy."
}

output "public_ip_addresses" {
  value       = azurerm_firewall.hub_fw.virtual_hub[0].public_ip_addresses
  description = "Public IP addresses assigned to the Azure Firewall."
}
