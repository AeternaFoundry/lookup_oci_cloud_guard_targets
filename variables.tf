variable "cloud_guard_targets_lookup" {
  description = <<EOT
Map of cloud_guard_targets_lookup, attributes below
Required:
    - compartment_id
Optional:
    - access_level
    - compartment_id_in_subtree
    - display_name
    - is_non_security_zone_targets_only_query
    - state
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id                          = string
    access_level                            = optional(string)
    compartment_id_in_subtree               = optional(bool)
    display_name                            = optional(string)
    is_non_security_zone_targets_only_query = optional(bool)
    state                                   = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

