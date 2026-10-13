
# 1. Centralized Firewall Policy
resource "azurerm_firewall_policy" "fw_policy" {
  name                = "fw-policy-${var.location}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Premium"

  dns {
    proxy_enabled = true
  }

  threat_intelligence_mode = "Alert"
  tags                     = var.tags
}

# 2. Azure Firewall deployed inside Secure Virtual Hub
resource "azurerm_firewall" "hub_fw" {
  name                = "afw-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_Hub"
  sku_tier            = "Premium"
  firewall_policy_id  = azurerm_firewall_policy.fw_policy.id

  virtual_hub {
    virtual_hub_id  = var.virtual_hub_id
    public_ip_count = 2
  }

  tags = var.tags
}

# 3. Routing Intent (Force all Private & Internet traffic through Azure Firewall)
resource "azurerm_virtual_hub_routing_intent" "routing_intent" {
  name           = "intent-${var.location}"
  virtual_hub_id = var.virtual_hub_id

  routing_policy {
    name           = "PrivateTraffic"
    destinations   = ["PrivateTraffic"]
    next_hop       = azurerm_firewall.hub_fw.id
  }

  routing_policy {
    name           = "InternetTraffic"
    destinations   = ["Internet"]
    next_hop       = azurerm_firewall.hub_fw.id
  }
}
