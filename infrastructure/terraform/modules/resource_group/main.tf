resource "azurerm_resource_group" "this" {
  name     = var.resource_name
  location = var.location
  tags     = var.tags
}