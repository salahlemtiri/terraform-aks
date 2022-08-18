#######################################################
#           Ressource group
#######################################################

resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}
resource "azurerm_resource_group" "rg" { 
  name     = "${var.name}-${random_string.random.result}"
  location = var.location
  tags     = var.tags
}