# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "advanced_level_1_compartments" {
  description = "The level 1 compartments."
  value       = oci_identity_compartment.advanced_level_1 #module.lz_level_1_compartments.compartments
}

output "advanced_level_2_compartments" {
  description = "The level 2 compartments, children of level 1 compartments."
  value       = oci_identity_compartment.advanced_level_2 #module.lz_level_2_compartments.compartments
}

output "advanced_level_3_compartments" {
  description = "The level 3 compartments, children of level 2 compartments."
  value       = oci_identity_compartment.advanced_level_3 #module.lz_level_3_compartments.compartments
}

output "advanced_level_4_compartments" {
  description = "The level 4 compartments, children of level 3 compartments."
  value       = oci_identity_compartment.advanced_level_4 #module.lz_level_4_compartments.compartments
}

output "advanced_level_5_compartments" {
  description = "The level 5 compartments, children of level 4 compartments."
  value       = oci_identity_compartment.advanced_level_5 #module.lz_level_5_compartments.compartments
}

/* output "enclosing_compartment_id" {
  description = "CIS Landing Zone enclosing compartment ocid."
  value       = local.enclosing_compartment_id
}
output "enclosing_compartment_name" {
  description = "CIS Landing Zone enclosing compartment name."
  value       = local.enclosing_compartment_name
}
output "core_compartments" {
  description = "CIS Landing Zone core compartments."
  value       = oci_identity_compartment.these #module.lz_level_5_compartments.compartments
}

output "workloads_divisions_compartment" {
  description = "CIS Landing Zone division compartments."
  value       = oci_identity_compartment.divisions
}

output "workloads_lifecycle_envs_compartment" {
  description = "CIS Landing Zone lifecycle environments compartments."
  value       = oci_identity_compartment.lifecycle_envs
}

output "workloads_applications_compartment" {
  description = "CIS Landing Zone applications compartments."
  value       = oci_identity_compartment.applications
}

output "workloads_application_layers_compartment" {
  description = "CIS Landing Zone application layers compartments."
  value       = oci_identity_compartment.layers
} */