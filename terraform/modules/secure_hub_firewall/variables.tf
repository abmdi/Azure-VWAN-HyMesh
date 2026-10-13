
variable "location" {
  type        = string
  description = "Azure region for the firewall deployment."
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group where the Firewall resides."
}

variable "virtual_hub_id" {
  type        = string
  description = "ID of the target Virtual Hub."
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default     = {}
}
