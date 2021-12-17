# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "tenancy_ocid" {
  description = "The OCI tenancy OCID."
}
variable "user_ocid" {
  description = "The user OCID."
  default=""
}
variable "fingerprint" {
  description = "The user API key fingerprint."
  default=""
}
variable "private_key_path" {
  description = "The user API private key path, including the file name itself."
  default=""
}
variable "private_key_password" {
  description = "The user API private key password, if any."
  default=""
}
variable "home_region_name" {
  type        = string
  description = "The tenancy home region name."
}

variable "compartments" {
  description = "The compartments, given as a map of objects."
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
  description = "Whether compartments are physically deleted upon destroy."
  type = bool
  default = true
}