variable "virtual_desktop_host_pools" {
  description = <<EOT
Map of virtual_desktop_host_pools, attributes below
Required:
    - load_balancer_type
    - location
    - name
    - resource_group_name
    - type
Optional:
    - custom_rdp_properties
    - description
    - friendly_name
    - maximum_sessions_allowed
    - personal_desktop_assignment_type
    - preferred_app_group_type
    - public_network_access
    - start_vm_on_connect
    - tags
    - validate_environment
    - vm_template
    - scheduled_agent_updates (block):
        - enabled (optional)
        - schedule (optional, block):
            - day_of_week (required)
            - hour_of_day (required)
        - timezone (optional)
        - use_session_host_timezone (optional)
EOT

  type = map(object({
    load_balancer_type               = string
    location                         = string
    name                             = string
    resource_group_name              = string
    type                             = string
    custom_rdp_properties            = optional(string)
    description                      = optional(string)
    friendly_name                    = optional(string)
    maximum_sessions_allowed         = optional(number)
    personal_desktop_assignment_type = optional(string)
    preferred_app_group_type         = optional(string)
    public_network_access            = optional(string)
    start_vm_on_connect              = optional(bool)
    tags                             = optional(map(string))
    validate_environment             = optional(bool)
    vm_template                      = optional(string)
    scheduled_agent_updates = optional(object({
      enabled = optional(bool)
      schedule = optional(list(object({
        day_of_week = string
        hour_of_day = number
      })))
      timezone                  = optional(string)
      use_session_host_timezone = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        v.scheduled_agent_updates == null || (v.scheduled_agent_updates.schedule == null || (length(v.scheduled_agent_updates.schedule) <= 2))
      )
    ])
    error_message = "Each schedule list must contain at most 2 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        v.friendly_name == null || (length(v.friendly_name) >= 1 && length(v.friendly_name) <= 64)
      )
    ])
    error_message = "must be between 1 and 64 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        v.description == null || (length(v.description) >= 1 && length(v.description) <= 512)
      )
    ])
    error_message = "must be between 1 and 512 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        v.maximum_sessions_allowed == null || (v.maximum_sessions_allowed >= 0 && v.maximum_sessions_allowed <= 999999)
      )
    ])
    error_message = "must be between 0 and 999999"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        v.scheduled_agent_updates == null || (v.scheduled_agent_updates.schedule == null || alltrue([for item in v.scheduled_agent_updates.schedule : (item.hour_of_day >= 0 && item.hour_of_day <= 23)]))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        v.vm_template == null || (can(jsondecode(v.vm_template)))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

