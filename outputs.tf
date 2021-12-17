# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "level_1_compartments" {
  description = "The level 1 compartments"
  value       = module.lz_level_1_compartments.compartments
}

output "level_2_compartments" {
  description = "The level 2 compartments"
  value       = module.lz_level_2_compartments.compartments
}

output "level_3_compartments" {
  description = "The level 3 compartments"
  value       = module.lz_level_3_compartments.compartments
}

output "level_4_compartments" {
  description = "The level 4 compartments"
  value       = module.lz_level_4_compartments.compartments
}

output "level_5_compartments" {
  description = "The level 5 compartments"
  value       = module.lz_level_5_compartments.compartments
}