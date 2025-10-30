variable "service_plan_name" {
  description = "App service plan name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "os_type" {
  description = "OS type (Windows or Linux)"
  type        = string
  
  validation {
    condition     = contains(["Windows", "Linux"], var.os_type)
    error_message = "OS type must be Windows or Linux."
  }
}

variable "sku_name" {
  description = "SKU name (Y1 for Consumption, P1v2, P2v2, P3v2 for Premium, S1, S2, S3 for Standard)"
  type        = string
  
  validation {
    condition     = contains(["F1","Y1", "B1", "B2", "B3", "S1", "S2", "S3", "P1v2", "P2v2", "P3v2", "P1v3", "P2v3", "P3v3"], var.sku_name)
    error_message = "Invalid SKU name. Valid values: Y1, B1-B3, S1-S3, P1v2-P3v2, P1v3-P3v3."
  }
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}