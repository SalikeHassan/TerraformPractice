output "container_name" {
  description = "Container name"
  value       = azurerm_storage_container.this.name
}

output "container_id" {
  description = "Container ID"
  value       = azurerm_storage_container.this.id
}