# 1. Core Virtual WAN and Resource Group
module "vwan_core" {
  source           = "./modules/vwan_core"
  project_prefix   = var.project_prefix
  environment      = var.environment
  primary_location = var.primary_location
  tags             = var.common_tags
}

# 2. Primary Virtual WAN Hub (East US)
module "hub_eastus" {
  source              = "./modules/vwan_hub"
  location            = var.primary_location
  environment         = var.environment
  resource_group_name = module.vwan_core.resource_group_name
  vwan_id             = module.vwan_core.vwan_id
  address_prefix      = var.vwan_hubs_config["hub_primary"].address_prefix
  tags                = var.common_tags
}

# 3. Secondary/Redundant Virtual WAN Hub (West Europe)
module "hub_westeurope" {
  source              = "./modules/vwan_hub"
  location            = var.secondary_location
  environment         = var.environment
  resource_group_name = module.vwan_core.resource_group_name
  vwan_id             = module.vwan_core.vwan_id
  address_prefix      = var.vwan_hubs_config["hub_secondary"].address_prefix
  tags                = var.common_tags
}

# 4. Secure Hub Firewall & Routing Intent (East US Primary)
module "secure_firewall_eastus" {
  source              = "./modules/secure_hub_firewall"
  location            = var.primary_location
  resource_group_name = module.vwan_core.resource_group_name
  virtual_hub_id      = module.hub_eastus.hub_id
  tags                = var.common_tags
}

# 5. Secure Hub Firewall & Routing Intent (West Europe Secondary)
module "secure_firewall_westeurope" {
  source              = "./modules/secure_hub_firewall"
  location            = var.secondary_location
  resource_group_name = module.vwan_core.resource_group_name
  virtual_hub_id      = module.hub_westeurope.hub_id
  tags                = var.common_tags
}

# 6. Spoke VNet 01 - Production (East US)
module "spoke_prod_eastus" {
  source              = "./modules/spoke_vnet"
  vnet_name           = "vnet-${var.primary_location}-prod-01"
  location            = var.primary_location
  resource_group_name = module.vwan_core.resource_group_name
  address_space       = ["10.1.0.0/16"]
  virtual_hub_id      = module.hub_eastus.hub_id
  tags                = var.common_tags
}

# 7. Spoke VNet 02 - Shared Services (East US)
module "spoke_shared_eastus" {
  source              = "./modules/spoke_vnet"
  vnet_name           = "vnet-${var.primary_location}-shared-01"
  location            = var.primary_location
  resource_group_name = module.vwan_core.resource_group_name
  address_space       = ["10.2.0.0/16"]
  virtual_hub_id      = module.hub_eastus.hub_id
  tags                = var.common_tags
}

# 8. Spoke VNet 03 - European Regional Workloads (West Europe)
module "spoke_prod_westeurope" {
  source              = "./modules/spoke_vnet"
  vnet_name           = "vnet-${var.secondary_location}-prod-01"
  location            = var.secondary_location
  resource_group_name = module.vwan_core.resource_group_name
  address_space       = ["10.3.0.0/16"]
  virtual_hub_id      = module.hub_westeurope.hub_id
  tags                = var.common_tags
}
