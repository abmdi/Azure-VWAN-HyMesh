# 1. Spoke Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

# 2. Network Security Group (NSG) for Workload Subnet
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.vnet_name}-workload-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# 3. Workload Subnet associated with the NSG
resource "azurerm_subnet" "workload" {
  name                 = "snet-workload-01"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.address_space[0], 4, 0)]
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = azurerm_subnet.workload.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# 4. Hub-to-Spoke VNet Connection
resource "azurerm_virtual_hub_connection" "vnet_connection" {
  name                      = "conn-${var.vnet_name}-to-hub"
  virtual_hub_id            = var.virtual_hub_id
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
  internet_security_enabled = true
}
