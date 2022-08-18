variable "vnet_name" {
  type        = string
  description = "This variable defines the vnet name"
}

variable "address_space" {
  type        = string
  description = "This variable defines the adress space used by the Vnet"
}

variable "resource_group_name" {
  type        = string
  description = "This variable defines the resource group name"
}

variable "location" {
  type        = string
  description = "This variable defines the location of the resource"
}

variable "tags" {
  type = object({           
    project     = string
    location    = string
    CreatedBy  = string
  })
  description = "This variable defines the resources tags"
}

variable "count_instances" {
  type        = number
  description = "This variable defines the number of instances"
  default = 1
}

variable "subnet_data" {
  type = list(object({
    subnet_name = string
    subnet_cidr = string
    service_endpoints = list(string)
    enforce_private_link_endpoint_network_policies = bool
  }))
}

variable "service_endpoints" {
  description = "Subnet Service Endpoints."
  type        = list(string)
  default     = []
}