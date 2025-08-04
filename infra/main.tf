provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}


module "network" {
  source              = "./modules/network"
  vnet_name           = "vnet-devsu"
  subnet_name         = "snet-devsu"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
}



module "acr" {
  source              = "./modules/acr"
  name                = "devsuacr"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = "Basic"
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  subnet_id           = module.network.subnet_id
  acr_id              = module.acr.acr_id
  name                = "aks-devsu"
  dns_prefix          = "aks-devsu"
}


