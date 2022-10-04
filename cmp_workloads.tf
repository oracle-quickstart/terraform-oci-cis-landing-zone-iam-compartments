# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

### This Terraform configuration manages Landing Zone workload compartments in the tenancy.

locals {

  workloads_defined_tags = null
  workloads_freeform_tags = {"cis-landing-zone" : var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-workloads" : "workloads"}  

  division_cmps = {
    for d in var.divisions : "DIV-${index(var.divisions,d)}" => {
      parent_id     = local.enclosing_compartment_id
      name          = var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${d}-cmp" : "${d}-cmp"
      description   = "CIS Landing Zone compartment for ${d} division."
      enable_delete = var.enable_compartments_delete
      defined_tags  = local.workloads_defined_tags
      freeform_tags = merge(local.workloads_freeform_tags,{"type":"div"})
    }
  }

  lifecycle_env_cmps = flatten([
    for d in var.divisions : [
      for e in var.lifecycle_envs : {
        key = "DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}"
        name = var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${e}-cmp" : "${e}-cmp"
        description = "CIS Landing Zone compartment for ${d}'s ${e} lifecycle environment."
        parent_id = oci_identity_compartment.divisions["DIV-${index(var.divisions,d)}"].id
        enable_delete = var.enable_compartments_delete
        defined_tags = local.workloads_defined_tags
        freeform_tags = merge(local.workloads_freeform_tags,{"type":"env"})
      }
    ]
  ])

  application_cmps = flatten([
    for d in var.divisions : [
      for e in var.lifecycle_envs : [ 
        for a in var.applications : {
          key = "DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}"  
          name = var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${a}-cmp" : "${a}-cmp"
          description = "CIS Landing Zone compartment for ${e}'s ${a} application in ${d} division."
          parent_id = oci_identity_compartment.lifecycle_envs["DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}"].id
          enable_delete = var.enable_compartments_delete
          defined_tags = local.workloads_defined_tags
          freeform_tags = merge(local.workloads_freeform_tags,{"type":"app"})
        }
      ]
    ]
  ])

  web_layer_cmps = flatten([
    for d in var.divisions : [
      for e in var.lifecycle_envs : [ 
        for a in var.applications : [
          for l in var.enable_web_layer_for : {
            key = "DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}.WEB-${index(var.enable_web_layer_for,l)}"
            name = var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${a}-web-cmp" : "${a}-web-cmp"
            description = "CIS Landing Zone compartment for ${a}'s application web tier in ${d}'s ${e} environment."
            parent_id = oci_identity_compartment.applications["DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}"].id
            enable_delete = var.enable_compartments_delete
            defined_tags = local.workloads_defined_tags
            freeform_tags = merge(local.workloads_freeform_tags,{"type":"web"})
          } if l == a  
        ]
      ]
    ]
  ])

  midtier_layer_cmps = flatten([
    for d in var.divisions : [
      for e in var.lifecycle_envs : [ 
        for a in var.applications : [
          for l in var.enable_midtier_layer_for : {
            key = "DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}.MTIER-${index(var.enable_midtier_layer_for,l)}"
            name = var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${a}-midtier-cmp" : "${a}-midtier-cmp"
            description = "CIS Landing Zone compartment for ${a}'s application middle tier in ${d}'s ${e} environment."
            parent_id = oci_identity_compartment.applications["DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}"].id
            enable_delete = var.enable_compartments_delete
            defined_tags = local.workloads_defined_tags
            freeform_tags = merge(local.workloads_freeform_tags,{"type":"mid"})
          } if l == a  
        ]
      ]
    ]
  ])

  db_layer_cmps = flatten([
    for d in var.divisions : [
      for e in var.lifecycle_envs : [ 
        for a in var.applications : [
          for l in var.enable_db_layer_for : {
            key = "DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}.DB-${index(var.enable_db_layer_for,l)}"
            name = var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${a}-db-cmp" : "${a}-db-cmp"
            description = "CIS Landing Zone compartment for ${a}'s application database tier in ${d}'s ${e} environment."
            parent_id = oci_identity_compartment.applications["DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}"].id
            enable_delete = var.enable_compartments_delete
            defined_tags = local.workloads_defined_tags
            freeform_tags = merge(local.workloads_freeform_tags,{"type":"db"})
          } if l == a  
        ]
      ]
    ]
  ])

  storage_layer_cmps = flatten([
    for d in var.divisions : [
      for e in var.lifecycle_envs : [ 
        for a in var.applications : [
          for l in var.enable_storage_layer_for : {
            key = "DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}.DB-${index(var.enable_storage_layer_for,l)}"
            name = var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${a}-storage-cmp" : "${a}-storage-cmp"
            description = "CIS Landing Zone compartment for ${a}'s application storage tier in ${d}'s ${e} environment."
            parent_id = oci_identity_compartment.applications["DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}"].id
            enable_delete = var.enable_compartments_delete
            defined_tags = local.workloads_defined_tags
            freeform_tags = merge(local.workloads_freeform_tags,{"type":"stg"})
          } if l == a  
        ]
      ]
    ]
  ])

  mgmt_layer_cmps = flatten([
    for d in var.divisions : [
      for e in var.lifecycle_envs : [ 
        for a in var.applications : [
          for l in var.enable_mgmt_layer_for : {
            key = "DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}.DB-${index(var.enable_mgmt_layer_for,l)}"
            name = var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${a}-mgmt-cmp" : "${a}-mgmt-cmp"
            description = "CIS Landing Zone compartment for ${a}'s application management tier in ${d}'s ${e} environment."
            parent_id = oci_identity_compartment.applications["DIV-${index(var.divisions,d)}.ENV-${index(var.lifecycle_envs,e)}.APP-${index(var.applications,a)}"].id
            enable_delete = var.enable_compartments_delete
            defined_tags = local.workloads_defined_tags
            freeform_tags = merge(local.workloads_freeform_tags,{"type":"mgmt"})
          } if l == a  
        ]
      ]
    ]
  ])

  application_layers_cmps = concat(local.web_layer_cmps, local.midtier_layer_cmps, local.db_layer_cmps, local.storage_layer_cmps, local.mgmt_layer_cmps)

} 

resource "oci_identity_compartment" "divisions" {
  for_each =  local.division_cmps
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = each.value.enable_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

resource "oci_identity_compartment" "lifecycle_envs" {
  for_each =  {for c in local.lifecycle_env_cmps : c.key => {name: c.name, 
                                                             description: c.description,
                                                             parent_id: c.parent_id,
                                                             enable_delete: c.enable_delete,
                                                             defined_tags: c.defined_tags,
                                                             freeform_tags: c.freeform_tags}}
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = each.value.enable_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

resource "oci_identity_compartment" "applications" {
  for_each =  {for c in local.application_cmps : c.key => {name: c.name, 
                                                           description: c.description,
                                                           parent_id: c.parent_id,
                                                           enable_delete: c.enable_delete,
                                                           defined_tags: c.defined_tags,
                                                           freeform_tags: c.freeform_tags}}
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = each.value.enable_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

resource "oci_identity_compartment" "layers" {
  for_each =  {for c in local.application_layers_cmps : c.key => {name: c.name, 
                                                                  description: c.description,
                                                                  parent_id: c.parent_id,
                                                                  enable_delete: c.enable_delete,
                                                                  defined_tags: c.defined_tags,
                                                                  freeform_tags: c.freeform_tags}}
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = each.value.enable_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}