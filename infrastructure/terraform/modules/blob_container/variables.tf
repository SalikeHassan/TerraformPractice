variable "container_name" {
  description = "Container name"
  type        = string
  
#   validation {
#     condition     = can(regex("^[a-z0-9](?!.*--)[a-z0-9-]{1,61}[a-z0-9]$", var.container_name))
#     error_message = "Container name must be 3-63 characters, lowercase letters, numbers, and hyphens only."
#   }
}

variable "storage_account_id" {
  description = "Storage account ID"
  type        = string
}

variable "container_access_type" {
  description = "Container access type (private, blob, or container)"
  type        = string
  
  validation {
    condition     = contains(["private", "blob", "container"], var.container_access_type)
    error_message = "Valid values are private, blob, or container."
  }
}