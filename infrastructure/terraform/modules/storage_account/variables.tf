variable "storage_account_name" {
  description = "Storage account name"
  type        = string

  validation {
    condition = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Storage account name must be 3-24 characters, lowercase letters and numbers only."
  }
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string 
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "account_tier" {
   description = "Storage account tier"
   type = string

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "Account tier must be Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "Storage account replication type (LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS)"
  type        = string
  
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "Valid values are LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  }
}

variable "access_tier" {
  description = "Access tier for storage account (Hot or Cool)"
  type        = string
  
  validation {
    condition     = contains(["Hot", "Cool"], var.access_tier)
    error_message = "Access tier must be Hot or Cool."
  }
}

variable "enable_https_traffic_only" {
  description = "Enable HTTPS traffic only"
  type        = bool
}

variable "min_tls_version" {
  description = "Minimum TLS version (TLS1_0, TLS1_1, TLS1_2)"
  type        = string
  
  validation {
    condition     = contains(["TLS1_0", "TLS1_1", "TLS1_2"], var.min_tls_version)
    error_message = "Valid values are TLS1_0, TLS1_1, TLS1_2."
  }
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
}

variable "containers" {
  description = "List of blob containers to create"
  type = map(object({
    container_access_type = string
  }))
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}