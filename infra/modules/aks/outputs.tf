output "aks_name" {
  value = azurerm_kubernetes_cluster.this.name
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive = true
}

output "kubelet_identity_id" {
  value = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}
