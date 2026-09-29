# Azure VWAN Enterprise Hybrid Mesh (`Azure-VWAN-HyMesh`)

[![Terraform CI/CD](https://github.com/abmdi/Azure-VWAN-HyMesh/actions/workflows/terraform-ci.yml/badge.svg)](https://github.com/abmdi/Azure-VWAN-HyMesh/actions)
[![Azure Verified Modules](https://img.shields.io/badge/Azure_AVM-Compliant-0078D4?logo=microsoftazure)](https://azure.github.io/Azure-Verified-Modules/)
[![IaC: Terraform](https://img.shields.io/badge/IaC-Terraform_1.6+-844FBA?logo=terraform)](https://www.terraform.io/)
[![Security: Checkov Passed](https://img.shields.io/badge/Security-Checkov_Passed-brightgreen)](https://github.com/bridgecrewio/checkov)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

An enterprise-ready, multi-region hybrid networking topology built on **Azure Virtual WAN (vWAN)**, featuring **ExpressRoute Direct/Partner**, **Dynamic BGP Failover over IPsec VPN**, **Azure Firewall Premium Secure Hubs**, and **Routing Intent Inspection**.

Designed in accordance with Microsoft's **Cloud Adoption Framework (CAF)** and **Azure Enterprise-Scale Landing Zone** recommendations.

---

## 🌟 Key Architectural Highlights

- **Global Multi-Region Mesh Hubs:** Dual-hub topology (`East US` & `West Europe`) interconnected seamlessly across the Microsoft Global Backbone.
- **Sub-Second Path Failover:** Active/Passive hybrid path design using BGP Local Preference & AS-Path Prepending across ExpressRoute and S2S IPsec VPN.
- **Zero-Trust Secure Virtual Hub:** Integrated Azure Firewall Premium in each hub with Routing Intent forcing all East-West (VNet-to-VNet / VNet-to-Branch) and North-South (Internet) traffic inspection.
- **Production-Grade Modular IaC:** Fully parameterized Terraform design leveraging sub-modules adhering to Azure Verified Modules standards.
- **Automated Verification:** Custom bash and PowerShell scripts for BGP route table analysis, failover testing, and GitHub Actions CI/CD workflows.

---

## 📐 Enterprise Network Topology

```text
                           +-------------------------------------+
                           |    On-Premises Enterprise DC        |
                           |   (AS65001 - Palo Alto / Cisco)     |
                           +------------------+------------------+
                                              |
                     +------------------------+------------------------+
                     | Primary Path                            | Backup Path
             (Azure ExpressRoute Circuit)              (Site-to-Site IPsec VPN)
                     |                                         |
                     v                                         v
  +---------------------------------------------------------------------------------------+
  |                                 Azure Virtual WAN                                     |
  |                              (vwan-ent-prod-eastus)                                   |
  |                                                                                       |
  |  +-------------------------------------+       +-----------------------------------+  |
  |  |    Hub Region 1: East US          |       |    Hub Region 2: West Europe      |  |
  |  |  (10.100.0.0/23)                    |       |  (10.102.0.0/23)                  |  |
  |  |  - ExpressRoute GW (AS65515)        |<----->|  - ExpressRoute GW (AS65515)     |  |
  |  |  - S2S VPN GW                       | Mesh  |  - S2S VPN GW                     |  |
  |  |  - Azure Firewall (Secure Hub)      | Peer  |  - Azure Firewall (Secure Hub)   |  |
  |  |  - Routing Intent (All-Traffic)     |       |  - Routing Intent (All-Traffic)   |  |
  |  +------------------+------------------+       +-----------------+-----------------+  |
  +---------------------|--------------------------------------------|--------------------+
                        |                                            |
         +--------------+--------------+              +--------------+--------------+
         v                             v              v                             v
+------------------+   +------------------+  +------------------+   +------------------+
| Spoke 01: Prod   |   | Spoke 02: Shared |  | Spoke 03: Prod EU|   | Spoke 04: Legacy |
| (10.1.0.0/16)    |   | (10.2.0.0/16)    |  | (10.3.0.0/16)    |   | (10.4.0.0/16)    |
| - Private Endpts |   | - Domain/DNS     |  | - Web Tier       |   | - Migration Subnet|
+------------------+   +------------------+  +------------------+   +------------------+
