resource "azurerm_resource_group" "rg_vwan" {
  name     = "rg-${var.project_prefix}-${var.environment}-vwan"
  location = var.primary_location
  tags     = var.tags
}

resource "azurerm_virtual_wan" "vwan" {
  name                              = "vwan-${var.project_prefix}-${var.environment}"
  resource_group_name               = azurerm_resource_group.rg_vwan.name
  location                          = azurerm_resource_group.rg_vwan.location
  type                              = "Standard"
  allow_branch_to_branch_traffic    = true
  office_365_local_breakout_category = "OptimizeAndAllow"
  tags                              = var.tags
}
