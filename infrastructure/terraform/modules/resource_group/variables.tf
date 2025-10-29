variable "resource_name" {
  description = "Resource name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string  # Changed to string instead of list
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}