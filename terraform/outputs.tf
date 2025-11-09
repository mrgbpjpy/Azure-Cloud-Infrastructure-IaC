
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "app_service_default_hostname" {
  value = azurerm_linux_web_app.app.default_hostname
}

output "container_registry_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.law.workspace_id
}
