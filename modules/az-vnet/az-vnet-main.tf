#######################################################
#           VNET
#######################################################

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.address_space]
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}

#######################################################
#           Subnet
#######################################################

resource "azurerm_subnet" "subnet" {
  depends_on                                     = [azurerm_virtual_network.vnet]
  count                                          = var.count_instances
  name                                           = var.subnet_data[count.index].subnet_name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.vnet_name
  address_prefixes                               = [var.subnet_data[count.index].subnet_cidr]
  service_endpoints                              = var.subnet_data[count.index].service_endpoints
  enforce_private_link_endpoint_network_policies = var.subnet_data[count.index].enforce_private_link_endpoint_network_policies
}