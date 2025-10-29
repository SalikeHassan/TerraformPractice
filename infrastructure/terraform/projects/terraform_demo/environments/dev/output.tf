output "resource_group_names" {
  description = "Resource group names"
  value = { for k, v in module.resource_group : k => v.name }
}

output "resource_group_locations" {
  description = "Resource group locations"
  value = { for k, v in module.resource_group : k => v.location }
}

output "resource_group_ids" {
  description = "Resource group IDs"
  value = { for k, v in module.resource_group : k => v.id }
}