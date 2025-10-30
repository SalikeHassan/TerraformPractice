resource "azurerm_storage_account" "this" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier = var.access_tier
  tags = var.tags
  https_traffic_only_enabled =  var.enable_https_traffic_only
  min_tls_version                 = var.min_tls_version
  public_network_access_enabled   = var.public_network_access_enabled
}