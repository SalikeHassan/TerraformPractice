locals {
  common_tags = {
    Project      = var.project_full_name
    Environment  = var.environment
    CreatedBy    = var.created_by
    CreationDate = formatdate("MM-DD-YYYY", timestamp())
  }
}

module "resource_group" {
  source = "../../../../modules/resource_group"

  for_each = toset(var.locations)

  resource_name = "Hassan_${var.project_name}_rg_${var.environment}"
  location      = each.value
  tags          = local.common_tags
}

module "storage_account" {
  source   = "../../../../modules/storage_account"
  for_each = toset(var.locations)

  storage_account_name          = lower(replace("hassan${var.project_name}sa${var.environment}", " ", ""))
  resource_group_name           = module.resource_group[each.key].name
  location                      = each.value
  account_tier                  = var.storage_account_tier
  account_replication_type      = var.storage_replication_type
  access_tier                   = var.storage_access_tier
  enable_https_traffic_only     = var.enable_https_traffic_only
  min_tls_version               = var.min_tls_version
  public_network_access_enabled = var.public_network_access_enabled

  containers = var.blob_containers
  tags       = local.common_tags

  depends_on = [module.resource_group]
}