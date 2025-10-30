locals {
  common_tags = {
    Project      = var.project_full_name
    Environment  = var.environment
    CreatedBy    = var.created_by
    CreationDate = formatdate("MM-DD-YYYY", timestamp())
  }

  blob_container_map = {
    for pair in flatten([
      for location in var.locations : [
        for container_key, container_value in var.blob_containers : {
          key                   = "${location}-${container_key}"
          location              = location
          container_name        = container_key
          container_access_type = container_value.container_access_type
        }
      ]
    ]) : pair.key => pair
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
  tags                          = local.common_tags

  depends_on = [module.resource_group]
}

module "blob_container" {
  source   = "../../../../modules/blob_container"
  for_each = local.blob_container_map

  container_name        = each.value.container_name
  storage_account_id    = module.storage_account[each.value.location].storage_account_id
  container_access_type = each.value.container_access_type

  depends_on = [module.storage_account]
}