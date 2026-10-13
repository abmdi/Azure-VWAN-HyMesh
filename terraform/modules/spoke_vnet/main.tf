# 1. Spoke Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

# 2. Workload Subnet
resource "azurerm_subnet" "workload" {
  name                 = "snet-workload-01"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.address_space[0], 4, 0)]
}

# 3. Hub-to-Spoke VNet Connection
resource "azurerm_virtual_hub_connection" "vnet_connection" {
  name                      = "conn-${var.vnet_name}-to-hub"
  virtual_hub_id            = var.virtual_hub_id
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
  internet_security_enabled = true
}
