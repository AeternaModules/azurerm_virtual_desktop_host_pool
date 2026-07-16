output "virtual_desktop_host_pools_id" {
  description = "Map of id values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.id if v.id != null && length(v.id) > 0 }
}
output "virtual_desktop_host_pools_custom_rdp_properties" {
  description = "Map of custom_rdp_properties values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.custom_rdp_properties if v.custom_rdp_properties != null && length(v.custom_rdp_properties) > 0 }
}
output "virtual_desktop_host_pools_description" {
  description = "Map of description values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.description if v.description != null && length(v.description) > 0 }
}
output "virtual_desktop_host_pools_friendly_name" {
  description = "Map of friendly_name values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.friendly_name if v.friendly_name != null && length(v.friendly_name) > 0 }
}
output "virtual_desktop_host_pools_load_balancer_type" {
  description = "Map of load_balancer_type values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.load_balancer_type if v.load_balancer_type != null && length(v.load_balancer_type) > 0 }
}
output "virtual_desktop_host_pools_location" {
  description = "Map of location values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.location if v.location != null && length(v.location) > 0 }
}
output "virtual_desktop_host_pools_maximum_sessions_allowed" {
  description = "Map of maximum_sessions_allowed values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.maximum_sessions_allowed if v.maximum_sessions_allowed != null }
}
output "virtual_desktop_host_pools_name" {
  description = "Map of name values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.name if v.name != null && length(v.name) > 0 }
}
output "virtual_desktop_host_pools_personal_desktop_assignment_type" {
  description = "Map of personal_desktop_assignment_type values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.personal_desktop_assignment_type if v.personal_desktop_assignment_type != null && length(v.personal_desktop_assignment_type) > 0 }
}
output "virtual_desktop_host_pools_preferred_app_group_type" {
  description = "Map of preferred_app_group_type values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.preferred_app_group_type if v.preferred_app_group_type != null && length(v.preferred_app_group_type) > 0 }
}
output "virtual_desktop_host_pools_public_network_access" {
  description = "Map of public_network_access values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.public_network_access if v.public_network_access != null && length(v.public_network_access) > 0 }
}
output "virtual_desktop_host_pools_resource_group_name" {
  description = "Map of resource_group_name values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "virtual_desktop_host_pools_scheduled_agent_updates" {
  description = "Map of scheduled_agent_updates values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.scheduled_agent_updates if v.scheduled_agent_updates != null && length(v.scheduled_agent_updates) > 0 }
}
output "virtual_desktop_host_pools_start_vm_on_connect" {
  description = "Map of start_vm_on_connect values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.start_vm_on_connect if v.start_vm_on_connect != null }
}
output "virtual_desktop_host_pools_tags" {
  description = "Map of tags values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "virtual_desktop_host_pools_type" {
  description = "Map of type values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.type if v.type != null && length(v.type) > 0 }
}
output "virtual_desktop_host_pools_validate_environment" {
  description = "Map of validate_environment values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.validate_environment if v.validate_environment != null }
}
output "virtual_desktop_host_pools_vm_template" {
  description = "Map of vm_template values across all virtual_desktop_host_pools, keyed the same as var.virtual_desktop_host_pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pools : k => v.vm_template if v.vm_template != null && length(v.vm_template) > 0 }
}

