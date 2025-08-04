variable "vnet_name" {
  description = "Nombre de la red virtual"
  type        = string
}

variable "subnet_name" {
  description = "Nombre de la subred"
  type        = string
}

variable "address_space" {
  description = "Espacio de direcciones para la VNet"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "Prefijos para la subred"
  type        = list(string)
}

variable "location" {
  description = "Ubicación de Azure"
  type        = string
}

variable "resource_group_name" {
  description = "Nombre del resource group"
  type        = string
}
