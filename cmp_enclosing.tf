# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

### This Terraform configuration manages Landing Zone enclosing compartment in the tenancy.

/* locals {
  #----- Core compartments parent
  enclosing_compartment_id = (var.enable_core || length(var.divisions) > 0) ? (var.use_enclosing_compartment && var.existing_enclosing_compartment_id != null ? var.existing_enclosing_compartment_id : oci_identity_compartment.top[local.enclosing_compartment_key].id) : var.tenancy_id

  #-----------------------------------------------------------
  #----- Enclosing compartment
  #-----------------------------------------------------------
  enclosing_compartment_key = "${var.cmp_name_prefix}-top-cmp"
  default_enclosing_compartment_name = "top-cmp"
  enclosing_compartment_name = var.enclosing_compartment_name != null ? var.enclosing_compartment_name : "${var.cmp_name_prefix}-${local.default_enclosing_compartment_name}"
  
  enclosing_compartment = (var.enable_core || length(var.divisions) > 0) && var.use_enclosing_compartment && var.existing_enclosing_compartment_id == null && !var.extend_landing_zone_to_new_region ? {
    (local.enclosing_compartment_key) = {
      parent_id     = var.tenancy_id
      name          = local.enclosing_compartment_name
      description   = "CIS Landing Zone enclosing compartment."
      enable_delete = var.enable_compartments_delete
      defined_tags  = local.defined_tags
      freeform_tags = merge(local.freeform_tags,{"type":"enc"})
    }
  } : {}
}  

resource "oci_identity_compartment" "top" {
  for_each =  local.enclosing_compartment
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = each.value.enable_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}
 */