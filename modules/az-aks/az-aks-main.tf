#######################################################
#           AKS
#######################################################

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  # Default node pool

  default_node_pool {
    name                = var.default_node_pool.name
    node_count          = var.default_node_pool.node_count
    vm_size             = var.default_node_pool.vm_size
    availability_zones  = var.default_node_pool.availability_zones
    enable_auto_scaling = var.default_node_pool.enable_auto_scaling
    min_count           = var.default_node_pool.min_count
    max_count           = var.default_node_pool.max_count
    max_pods            = var.default_node_pool.max_pods
    os_disk_size_gb     = var.default_node_pool.os_disk_size_gb
    type                = var.default_node_pool.type
    vnet_subnet_id      = var.vnet_subnet_id
  }

   role_based_access_control {
    enabled = true
  }

  # Network profile
  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = var.network_policy
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
    load_balancer_sku  = var.load_balancer_sku
    docker_bridge_cidr = var.docker_bridge_cidr
  }

 # Identity
    identity {
    type = "SystemAssigned"
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }

  tags = var.tags
}