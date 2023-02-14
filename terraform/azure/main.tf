provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "main" {
  name = var.group_name
  location = var.location
}

module "ServicePrincipal" {
  source = "./modules/ServicePrincipal"
  service_principal_name = var.service_principal_name

  depends_on = [
    azurerm_resource_group.main
  ]
}

resource "azurerm_role_assignment" "main" {
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/${var.group_name}"
  role_definition_name = "Contributor"
  principal_id         = module.ServicePrincipal.service_principal_object_id

  depends_on = [
    module.ServicePrincipal
  ]
}

module "KeyVault" {
  source = "./modules/KeyVault"
  key_vault_name = var.key_vault_name
  location = var.location
  resource_group_name = var.group_name

  depends_on = [
    azurerm_role_assignment.main
  ]
}

resource "azurerm_key_vault_secret" "main" {
  name = module.ServicePrincipal.client_id
  value = module.ServicePrincipal.client_secret
  key_vault_id = module.KeyVault.key_vault_id

  depends_on = [
    module.KeyVault
  ]
}
