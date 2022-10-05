# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "level_1_compartments" {
  description = "The level 1 compartments."
  value       = oci_identity_compartment.level_1
}

output "level_2_compartments" {
  description = "The level 2 compartments, children of level 1 compartments."
  value       = oci_identity_compartment.level_2
}

output "level_3_compartments" {
  description = "The level 3 compartments, children of level 2 compartments."
  value       = oci_identity_compartment.level_3
}

output "level_4_compartments" {
  description = "The level 4 compartments, children of level 3 compartments."
  value       = oci_identity_compartment.level_4
}

output "level_5_compartments" {
  description = "The level 5 compartments, children of level 4 compartments."
  value       = oci_identity_compartment.level_5
}

output "level_6_compartments" {
  description = "The level 6 compartments, children of level 5 compartments."
  value       = oci_identity_compartment.level_6
}