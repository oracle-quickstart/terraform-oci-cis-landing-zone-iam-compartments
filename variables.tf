# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

/* variable "tenancy_ocid" {
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
} */
variable "tenancy_id" {
  description = "The OCI tenancy OCID."
  type = "string"
}
variable "extend_landing_zone_to_new_region" {
  description = "Whether Landing Zone is being extended to another region."
  type = bool
  default = false
}
variable "cmp_name_prefix" {
  description = "Used as naming prefix to compartments names."
  type = string
  default = null
}
variable "use_enclosing_compartment" {
  description = "Whether an enclosing compartment is used."
  type = bool
  default = true
}
variable "existing_enclosing_compartment_id" {
  description = "The existing enclosing compartment ocid."
  type = string
  default = null
}
variable "enclosing_compartment_name" {
  description = "CIS Landing Zone enclosing compartment name."
  type = string
  default = null
}

#-------------------------------------------------------------
#-- Quick Start core compartments
#-------------------------------------------------------------
variable "enable_core" {
  description = "Whether core compartments are enabled."
  type = bool
  default = false
}
variable "enable_network_compartment" {
  description = "Whether the Network compartment is enabled."
  type = bool
  default = true
}
variable "network_compartment_name" {
  description = "CIS Landing Zone network compartment name. Passing a value overrides the default compartment name, which is <cmp_name_prefix>-network-cmp."
  type = string
  default = null
}
variable "enable_security_compartment" {
  description = "Whether the Security compartment is enabled."
  type = bool
  default = true
}
variable "security_compartment_name" {
  description = "CIS Landing Zone security compartment name. Passing a value overrides the default compartment name, which is <cmp_name_prefix>-security-cmp."
  type = string
  default = null
}
variable "enable_appdev_compartment" {
  description = "Whether the Application compartment is enabled."
  type = bool
  default = true
}
variable "appdev_compartment_name" {
  description = "CIS Landing Zone application compartment name. Passing a value overrides the default compartment name, which is <cmp_name_prefix>-appdev-cmp."
  type = string
  default = null
}
variable "enable_database_compartment" {
  description = "Whether the Database compartment is enabled."
  type = bool
  default = true
}
variable "database_compartment_name" {
  description = "CIS Landing Zone database compartment name. Passing a value overrides the default compartment name, which is <cmp_name_prefix>-database-cmp."
  type = string
  default = null
}
variable "enable_exainfra_compartment" {
  description = "Whether Exadata Cloud Service compartment is enabled."
  type = bool
  default = false
}
variable "exainfra_compartment_name" {
  description = "CIS Landing Zone Exadata Cloud Service infra compartment name. Passing a value overrides the default compartment name, which is <cmp_name_prefix>-exainfra-cmp."
  type = string
  default = null
}

#-------------------------------------------------------------
#-- Advanced compartments topology
#-------------------------------------------------------------
variable "advanced_compartments" {
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
  default = {}
}

#-------------------------------------------------------------
#-- Workloads compartments
#-------------------------------------------------------------
variable "divisions" {
  description = "The organization divisions, representing departaments, lines of business, etc."
  type = list(string)
  default = []
}
variable "lifecycle_envs" {
  description = "The lifecycle environments, representing dev, test, uat, prod, etc."
  type = list(string)
  default = []
}
variable "applications" {
  description = "The applications/projects."
  type = list(string)
  default = []
}
variable "enable_web_layer_for" {
  description = "The applications for which a web layer is required."
  type = list(string)
  default = []
}
variable "enable_midtier_layer_for" {
  description = "The applications for which a midtier layer is required."
  type = list(string)
  default = []
}
variable "enable_db_layer_for" {
  description = "The applications for which a database layer is required."
  type = list(string)
  default = []
}
variable "enable_storage_layer_for" {
  description = "The applications for which a storage layer is required."
  type = list(string)
  default = []
}
variable "enable_mgmt_layer_for" {
  description = "The applications for which a management layer is required."
  type = list(string)
  default = []
}
variable "enable_compartments_delete" {
  description = "Whether compartments are physically deleted upon destroy."
  type = bool
  default = true
}