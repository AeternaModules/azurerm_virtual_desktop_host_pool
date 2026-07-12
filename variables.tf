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
        v.scheduled_agent_updates == null || (v.scheduled_agent_updates.schedule == null || (length(v.scheduled_agent_updates.schedule) <= 2))
      )
    ])
    error_message = "Each schedule list must contain at most 2 items"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_virtual_desktop_host_pool's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: load_balancer_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: friendly_name
  #   condition: length(value) >= 1 && length(value) <= 64
  #   message:   must be between 1 and 64 characters
  # path: description
  #   condition: length(value) >= 1 && length(value) <= 512
  #   message:   must be between 1 and 512 characters
  # path: personal_desktop_assignment_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: public_network_access
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: maximum_sessions_allowed
  #   condition: value >= 0 && value <= 999999
  #   message:   must be between 0 and 999999
  # path: preferred_app_group_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: scheduled_agent_updates.schedule.day_of_week
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: scheduled_agent_updates.schedule.hour_of_day
  #   condition: value >= 0 && value <= 23
  #   message:   must be between 0 and 23
  # path: vm_template
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

