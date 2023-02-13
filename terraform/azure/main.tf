provider "azurerm" {
  features {

  }
}

resource "azurerm_Resource_group" "aksGroup" {
  name = var.group_name
  location = var.location
}
