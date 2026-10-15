# BGP Routing Policies & AS-Path Configuration

## Autonomous System Numbers (ASNs)
- **Azure Virtual WAN Hub (Public ASN):** `65515`
- **On-Premises Enterprise DC (Private ASN):** `65001`

## Route Advertisement Rules
1. **Spoke VNet Routes:** Automatically aggregated and advertised to on-premises via BGP by the Virtual Hub router.
2. **Branch-to-Branch Traffic:** Enabled globally via `allow_branch_to_branch_traffic = true` on the core vWAN resource.
3. **Forced Tunneling / Inspection:** Routing intent forces all internet and inter-site private prefixes through the regional Azure Firewall Premium nodes.
