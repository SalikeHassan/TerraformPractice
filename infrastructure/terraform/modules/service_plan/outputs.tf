output "service_plan_id" {
  description = "Service plan ID"
  value       = azurerm_service_plan.this.id
}

output "service_plan_name" {
  description = "Service plan name"
  value       = azurerm_service_plan.this.name
}

output "kind" {
  description = "Service plan kind"
  value       = azurerm_service_plan.this.kind
}