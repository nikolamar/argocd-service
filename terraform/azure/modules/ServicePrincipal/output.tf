output "service_principal_name" {
  description = "The object ID of the Service Principal. Can be used to assign roles to the Service Principal."
  value = azuread_service_principal.main.display_name
}

output "service_principal_object_id" {
  description = "The object ID of the Service Principal. Can be used to assign roles to the Service Principal."
  value = azuread_service_principal.main.object_id
}

output "service_principal_tenent_id" {
  description = "The tenant ID of the Service Principal."
  value = azuread_service_principal.main.application_tenant_id
}

output "service_principal_application_id" {
  description = "The application ID of the Service Principal."
  value = azuread_service_principal.main.application_id
}

output "client_id" {
  description = "The application ID of Azure AD application."
  value = azuread_application.main.application_id
}

output "client_secret" {
  description = "The password of the Service Principal."
  value = azuread_service_principal_password.main.value
}
