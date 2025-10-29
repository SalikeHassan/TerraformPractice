variable "project_name" {
  description = "Project name"
  type        = string
}

variable "project_full_name" {
  description = "Project full name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "locations" {
  description = "Azure regions"
  type        = list(string)
}

variable "created_by" {
  description = "Created by"
  type        = string
}

# Storage Account Variables
variable "storage_account_tier" {
  description = "Storage account tier"
  type        = string
}

variable "storage_replication_type" {
  description = "Storage replication type"
  type        = string
}

variable "storage_access_tier" {
  description = "Storage access tier"
  type        = string
}

variable "enable_https_traffic_only" {
  description = "Enable HTTPS traffic only"
  type        = bool
}

variable "min_tls_version" {
  description = "Minimum TLS version"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
}

variable "blob_containers" {
  description = "Blob containers to create"
  type = map(object({
    container_access_type = string
  }))
}