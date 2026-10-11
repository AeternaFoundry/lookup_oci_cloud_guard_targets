data "oci_cloud_guard_targets" "cloud_guard_targets_lookup" {
  for_each = var.cloud_guard_targets_lookup

  compartment_id                          = each.value.compartment_id
  access_level                            = each.value.access_level
  compartment_id_in_subtree               = each.value.compartment_id_in_subtree
  display_name                            = each.value.display_name
  is_non_security_zone_targets_only_query = each.value.is_non_security_zone_targets_only_query
  state                                   = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

