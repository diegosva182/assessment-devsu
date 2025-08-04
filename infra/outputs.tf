output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "aks_name" {
  value = module.aks.aks_name
}

output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}
