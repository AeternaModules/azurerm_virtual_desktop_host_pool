output "virtual_desktop_host_pools" {
  description = "All virtual_desktop_host_pool resources"
  value       = azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools
}
output "virtual_desktop_host_pools_custom_rdp_properties" {
  description = "List of custom_rdp_properties values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.custom_rdp_properties]
}
output "virtual_desktop_host_pools_description" {
  description = "List of description values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.description]
}
output "virtual_desktop_host_pools_friendly_name" {
  description = "List of friendly_name values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.friendly_name]
}
output "virtual_desktop_host_pools_load_balancer_type" {
  description = "List of load_balancer_type values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.load_balancer_type]
}
output "virtual_desktop_host_pools_location" {
  description = "List of location values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.location]
}
output "virtual_desktop_host_pools_maximum_sessions_allowed" {
  description = "List of maximum_sessions_allowed values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.maximum_sessions_allowed]
}
output "virtual_desktop_host_pools_name" {
  description = "List of name values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.name]
}
output "virtual_desktop_host_pools_personal_desktop_assignment_type" {
  description = "List of personal_desktop_assignment_type values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.personal_desktop_assignment_type]
}
output "virtual_desktop_host_pools_preferred_app_group_type" {
  description = "List of preferred_app_group_type values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.preferred_app_group_type]
}
output "virtual_desktop_host_pools_public_network_access" {
  description = "List of public_network_access values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.public_network_access]
}
output "virtual_desktop_host_pools_resource_group_name" {
  description = "List of resource_group_name values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.resource_group_name]
}
output "virtual_desktop_host_pools_scheduled_agent_updates" {
  description = "List of scheduled_agent_updates values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.scheduled_agent_updates]
}
output "virtual_desktop_host_pools_start_vm_on_connect" {
  description = "List of start_vm_on_connect values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.start_vm_on_connect]
}
output "virtual_desktop_host_pools_tags" {
  description = "List of tags values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.tags]
}
output "virtual_desktop_host_pools_type" {
  description = "List of type values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.type]
}
output "virtual_desktop_host_pools_validate_environment" {
  description = "List of validate_environment values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.validate_environment]
}
output "virtual_desktop_host_pools_vm_template" {
  description = "List of vm_template values across all virtual_desktop_host_pools"
  value       = [for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : v.vm_template]
}

