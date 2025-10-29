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