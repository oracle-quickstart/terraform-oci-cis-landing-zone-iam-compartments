# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_identity_compartment" "these" {
  for_each       = var.compartments
    name           = each.value.name
    compartment_id = each.value.parent_id
    description    = each.value.description
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}