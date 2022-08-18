###################################################################################
#           Instantiate the global components
###################################################################################
module "mod_rg" {
    source                      = "./modules/az-rg"
    name                        = "${local.resource_prefix}-rg" 
    tags                        = local.tags
    location                    = local.location
}


module "mod_vnet_subnet" {
    source                  = "./modules/az-vnet"
    vnet_name               = "${local.resource_prefix}-vnet"
    tags                    = local.tags
    location                = local.location
    resource_group_name     = module.mod_rg.az_rg_name
    address_space           = local.vnet_default_cidr
    count_instances         = local.subnet_data_count
    subnet_data             = local.subnet_data
}

module "mod_aks_deploy" {
    source      = "./modules/az-aks"
    name        = "${local.resource_prefix}-aks"
    location    = local.location
    kubernetes_version  = "1.22.11"
    resource_group_name = module.mod_rg.az_rg_name
    dns_prefix = "${local.resource_prefix}-aks-dns"

    default_node_pool = {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_B2s"
    availability_zones  = [1, 2, 3]
    enable_auto_scaling = false
    min_count           = null
    max_count           = null
    max_pods            = 110
    os_disk_size_gb     = "60"
    type                = "VirtualMachineScaleSets"
  }

  vnet_subnet_id      = module.mod_vnet_subnet.az_subnet[0].id

  # Networking
  service_cidr = "10.240.0.0/16"
  network_plugin = "azure"
  network_policy = "azure"
  dns_service_ip = "10.240.0.10"

  tags        = local.tags
}
