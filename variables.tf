# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#-------------------------------------------------------------
#-- Arbitrary compartments topology
#-------------------------------------------------------------
variable "compartments" {
  description = "The compartments structure, given as a map of objects nested up to 6 levels."
  type = map(object({
    name          = string
    description   = string
    parent_id     = string
    defined_tags  = map(string)
    freeform_tags = map(string)
    children    = map(object({
      name          = string
      description   = string
      defined_tags  = map(string)
      freeform_tags = map(string)
      children      = map(object({
        name          = string
        description   = string
        defined_tags  = map(string)
        freeform_tags = map(string)
        children      = map(object({
          name          = string
          description   = string
          defined_tags  = map(string)
          freeform_tags = map(string)
          children      = map(object({
            name          = string
            description   = string
            defined_tags  = map(string)
            freeform_tags = map(string)
            children      = map(object({
              name          = string
              description   = string
              defined_tags  = map(string)
              freeform_tags = map(string)
            }))  
          }))
        }))
      }))
    }))  
  }))
  default = {}
}

variable "enable_compartments_delete" {
  description = "Whether compartments are physically deleted upon destroy."
  type = bool
  default = true
}