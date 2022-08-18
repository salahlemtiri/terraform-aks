output "az_vnet" {
  value = azurerm_virtual_network.vnet
}

output "az_subnet" {
  value = azurerm_subnet.subnet.*
}