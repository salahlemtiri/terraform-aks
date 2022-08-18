variable "name" {
  type        = string
  description = "The name of the AKS cluster"
}

variable "location" {
  type        = string
  description = "The location of the AKS cluster"
}

variable "resource_group_name" {
  type        = string
  description = "The rg name"
}

variable "dns_prefix" {
  type        = string
  description = "The DNS prefix name"
}

variable "kubernetes_version" {
  type        = string
  description = "The version of kubernetes"
}

variable "default_node_pool" {
  type = object({
    name                = string
    node_count          = number
    vm_size             = string
    availability_zones  = list(number)
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
    max_pods            = number
    os_disk_size_gb     = number
    type                = string
  })
  description = "This variable defines the subnets data to be created"
}

variable "network_plugin" {
  type        = string
  description = "Network plugin for kubenretes network overlay (azure or kubnet)."
}

variable "vnet_subnet_id" {
  type        = string
  description = "Network plugin for kubenretes network overlay (azure or kubnet)."
}


variable "network_policy" {
  type        = string
  description = "network policy (azure or calico)."
}

variable "service_cidr" {
  type        = string
  description = "kubernetes internal service cidr range."
}

variable "dns_service_ip" {
  type        = string
  description = "kubernetes internal that will be used by kube_dns."
}

variable "load_balancer_sku" {
  description = "Load balancer sku."
  type        = string
  default     = "Standard"
}

variable "docker_bridge_cidr" {
  type        = string
  description = "kubernetes internal docker service cidr range."
  default     = "172.17.0.1/16"
}

variable "tags" {
  type = object({        
    project     = string
    location    = string
    CreatedBy  = string
  })
  description = "This variable defines the resources tags"
}