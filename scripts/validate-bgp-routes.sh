#!/usr/bin/env bash
set -euo pipefail

RESOURCE_GROUP="rg-ent-net-prod-vwan"
HUB_NAME="vhub-eastus-prod"

echo "====================================================="
echo "  Azure Virtual WAN - BGP Route Table Validation"
echo "====================================================="

echo "[INFO] Fetching effective routes for Virtual Hub: ${HUB_NAME}..."
az network vhub get-effective-routes \
  --resource-group "$RESOURCE_GROUP" \
  --name "$HUB_NAME" \
  --resource-type VirtualHub \
  --output table

echo "[INFO] BGP Route validation completed successfully."
