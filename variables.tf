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
    maximum_sessions_allowed         = optional(number) # Default: 999999
    personal_desktop_assignment_type = optional(string)
    preferred_app_group_type         = optional(string) # Default: "Desktop"
    public_network_access            = optional(string) # Default: "Enabled"
    start_vm_on_connect              = optional(bool)   # Default: false
    tags                             = optional(map(string))
    validate_environment             = optional(bool) # Default: false
    vm_template                      = optional(string)
    scheduled_agent_updates = optional(object({
      enabled = optional(bool) # Default: false
      schedule = optional(list(object({
        day_of_week = string
        hour_of_day = number
      })))
      timezone                  = optional(string) # Default: "UTC"
      use_session_host_timezone = optional(bool)   # Default: false
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_host_pools : (
        v.scheduled_agent_updates.schedule == null || (length(v.scheduled_agent_updates.schedule) <= 2)
      )
    ])
    error_message = "Each schedule list must contain at most 2 items"
  }
}

