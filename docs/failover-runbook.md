# Operational Runbook: Virtual WAN ExpressRoute to S2S VPN Failover

## 1. Overview
This runbook outlines the steps for validating, auditing, and troubleshooting automatic path failover between the primary **ExpressRoute Circuit** and the backup **Site-to-Site IPsec VPN** inside the Azure Virtual WAN hub.

## 2. Failover Mechanism Architecture
- **Primary Path:** ExpressRoute Gateway connected via private peering with BGP AS-Path prepending or local preference optimization.
- **Backup Path:** Site-to-Site IPsec VPN dynamic BGP tunnels terminated on the regional Virtual Hub VPN Gateway.
- **Convergence Time:** Sub-second automatic failover managed natively by the Azure Virtual WAN routing engine.

## 3. Routine Audit Steps
Run the automated validation script located in the repository:
```bash
bash ../scripts/failover-simulation.sh
