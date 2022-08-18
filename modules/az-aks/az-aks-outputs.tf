output "az_aks_principal_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  description = "AKS principal ID. Refers to MSI XXX_agentpool in the MC resource group"
}
output "az_aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
  description = "AKS resource id"
}

output "az_aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
  description = "AKS cluster name"
}