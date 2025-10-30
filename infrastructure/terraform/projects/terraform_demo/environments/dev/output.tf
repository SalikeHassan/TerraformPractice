output "resource_group_names" {
  description = "Resource group names"
  value       = { for k, v in module.resource_group : k => v.name }
}

output "resource_group_locations" {
  description = "Resource group locations"
  value       = { for k, v in module.resource_group : k => v.location }
}

output "resource_group_ids" {
  description = "Resource group IDs"
  value       = { for k, v in module.resource_group : k => v.id }
}

output "storage_account_names" {
  description = "Storage account names"
  value       = { for k, v in module.storage_account : k => v.storage_account_name }
}

output "storage_account_ids" {
  description = "Storage account IDs"
  value       = { for k, v in module.storage_account : k => v.storage_account_id }
}

output "primary_blob_endpoints" {
  description = "Primary blob endpoints"
  value       = { for k, v in module.storage_account : k => v.primary_blob_endpoint }
}

output "container_names" {
  description = "Container names"
  value       = [for k, v in module.blob_container : k]
}