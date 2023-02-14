variable "group_name" {
  type = string
  description = "Resource group for AKS cluster"
}

variable "location" {
  type = string
  default = "westeurope"
  description = "Location for AKS cluster"
}

variable "service_principal_name" {
  type = string
  description = "Service principal name for AKS cluster"
}

variable "subscription_id" {
  type = string
  description = "Subscription ID for AKS cluster"
}

variable "key_vault_name" {
  type = string
  description = "Key vault name for AKS cluster"
}
