locals {

#################################################
#           Project information 
#################################################
    company                     = "toto"
    code_project                = "test001"
    application_name            = "terraformaks"

    resource_prefix             = "${lower(local.company)}-${lower(local.code_project)}-${lower(local.application_name)}"
    resource_prefix_attached    = "${lower(local.company)}${lower(local.code_project)}${lower(local.application_name)}"

     
#################################################
#           Global variables
#################################################
    
    location                    = "westeurope"
    azure_subscription_id       = "xxxxxxxxxxxxxxxxxxxxxxx"
    
#################################################
#           Global tags
#################################################
  tags = {
    project    = local.application_name
    location   = local.location
    CreatedBy = "Terraform"
  }

#################################################
#           Vnet data
#################################################

vnet_default_cidr = "10.0.0.0/16" #Total of 65,536 adresses
subnet_cidr = "10.0.8.0/21" #Total of 2,048 adresses
subnet_data_count = length(local.subnet_data)

subnet_data = [
        {
            subnet_name = "aks_subnet"
            subnet_cidr = local.subnet_cidr
            service_endpoints = []
            enforce_private_link_endpoint_network_policies = false
        }
    ]
}
