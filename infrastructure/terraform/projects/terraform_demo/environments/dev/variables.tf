variable "project_name" {
  description = "Project name"
  type = string
}

variable "project_full_name" {
  description = "Project full name"
  type = string
}

variable "environment" {
  description = "Environment"
  type = string
}

variable "locations" {
  description = "Azure regions"
  type = list(string)
}

variable "created_by" {
  description = "Created by"
  type = string
}

# variable "creation_date" {
#   description = "Creation date"
#   type = string
# }