# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "tenancy_ocid" {}
variable "user_ocid" {
  default=""
}
variable "fingerprint" {
  default=""
}
variable "private_key_path" {
  default=""
}
variable "private_key_password" {
  default=""
}
variable "home_region_name" {
  type        = string
  description = "The tenancy home region name."
}

variable "compartments" {
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
          }))
        }))
      }))
    }))  
  }))
}

variable "enable_compartments_delete" {
  type = bool
  default = true
}