# 1. Regional Virtual WAN Hub
resource "azurerm_virtual_hub" "hub" {
  name                = "vhub-${var.location}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_wan_id      = var.vwan_id
  address_prefix      = var.address_prefix
  sku                 = "Standard"
  tags                = var.tags
}

# 2. ExpressRoute Gateway inside Virtual Hub
resource "azurerm_express_route_gateway" "er_gw" {
  name                = "ergw-${var.location}"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_hub_id      = azurerm_virtual_hub.hub.id
  scale_units         = 2
  tags                = var.tags
}

# 3. Site-to-Site VPN Gateway inside Virtual Hub
resource "azurerm_vpn_gateway" "s2s_gw" {
  name                = "vpngw-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  virtual_hub_id      = azurerm_virtual_hub.hub.id
  scale_unit          = 2
  tags                = var.tags
}
