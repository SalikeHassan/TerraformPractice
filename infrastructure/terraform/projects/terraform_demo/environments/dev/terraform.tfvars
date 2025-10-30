project_name = "demoproject"

project_full_name = "Terraform demo"

locations = ["East US"]

created_by = "Terraform Script"

environment = "dev"

# Storage Account Configuration - Dev Environment (Cost-optimized)
storage_account_tier          = "Standard"
storage_replication_type      = "LRS" # Cheapest option for dev
storage_access_tier           = "Hot" # Lower cost for dev
enable_https_traffic_only     = true
min_tls_version               = "TLS1_2"
public_network_access_enabled = true

# Blob Containers
blob_containers = {
  "demo" = {
    container_access_type = "private"
  }
}

# App Service Plan
service_plan_os_type  = "Windows"
service_plan_sku_name = "F1"