terraform {
  backend "azurerm" {
    # Resource group, storage account, and container name should be configured
    # during initialization via backend-config parameters or environment variables.
    # storage_account_name = "sttfstateentnetprod"
    # container_name       = "tfstate"
    # key                  = "azure-vwan-hymesh.tfstate"
  }
}
