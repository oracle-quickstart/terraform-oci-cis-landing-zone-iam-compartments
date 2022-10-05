# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

### This Terraform configuration provisions compartments in the tenancy.

locals {

  level_1 = [
    for k1,v1 in var.compartments : {
      key  = k1
      name = v1.name
      description = v1.description
      parent_id = v1.parent_id
      defined_tags = v1.defined_tags
      freeform_tags = v1.freeform_tags
    }
  ]

  level_2 = flatten([
    for k1,v1 in var.compartments : [
      for k2, v2 in v1.children : {
        key  = "${k1}.${k2}"
        name = v2.name
        description = v2.description
        parent_id = oci_identity_compartment.advanced_level_1[k1].id
        defined_tags = v2.defined_tags
        freeform_tags = v2.freeform_tags
      }
    ]
  ])

  level_3 = flatten([
    for k1,v1 in var.compartments : [
      for k2, v2 in v1.children : [
        for k3, v3 in v2.children : {
          key  = "${k1}.${k2}.${k3}"
          name = v3.name
          description = v3.description
          parent_id = oci_identity_compartment.advanced_level_2["${k1}.${k2}"].id
          defined_tags = v3.defined_tags
          freeform_tags = v3.freeform_tags
        }
      ]
    ]
  ])

  level_4 = flatten([
    for k1,v1 in var.compartments : [
      for k2, v2 in v1.children : [
        for k3, v3 in v2.children : [
          for k4, v4 in v3.children : {
            key  = "${k1}.${k2}.${k3}.${k4}"
            name = v4.name
            description = v4.description
            parent_id = oci_identity_compartment.advanced_level_3["${k1}.${k2}.${k3}"].id
            defined_tags = v4.defined_tags
            freeform_tags = v4.freeform_tags
          }
        ]  
      ]
    ]
  ])

  level_5 = flatten([
    for k1,v1 in var.compartments : [
      for k2, v2 in v1.children : [
        for k3, v3 in v2.children : [
          for k4, v4 in v3.children : [
            for k5, v5 in v4.children : {
              key  = "${k1}.${k2}.${k3}.${k4}.${k5}"
              name = v5.name
              description = v5.description
              parent_id = oci_identity_compartment.advanced_level_4["${k1}.${k2}.${k3}.${k4}"].id
              defined_tags = v5.defined_tags
              freeform_tags = v5.freeform_tags
            }  
          ]
        ]  
      ]
    ]
  ])

  level_6 = flatten([
    for k1,v1 in var.compartments : [
      for k2, v2 in v1.children : [
        for k3, v3 in v2.children : [
          for k4, v4 in v3.children : [
            for k5, v5 in v4.children : [
              for k6, v6 in v5.children : {
                key  = "${k1}.${k2}.${k3}.${k4}.${k5}.${k6}"
                name = v6.name
                description = v6.description
                parent_id = oci_identity_compartment.advanced_level_5["${k1}.${k2}.${k3}.${k4}.${k5}"].id
                defined_tags = v6.defined_tags
                freeform_tags = v6.freeform_tags
              }  
            ]  
          ]
        ]  
      ]
    ]
  ])
}

resource "oci_identity_compartment" "level_1" {
  for_each = {for c in local.level_1 : c.key => {name: c.name, 
                                                 description: c.description, 
                                                 parent_id: c.parent_id, 
                                                 defined_tags: c.defined_tags, 
                                                 freeform_tags: c.freeform_tags}}
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = var.enable_compartments_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

resource "oci_identity_compartment" "level_2" {
  for_each = {for c in local.level_2 : c.key => {name: c.name, 
                                                 description: c.description,
                                                 parent_id: c.parent_id,
                                                 defined_tags: c.defined_tags,
                                                 freeform_tags: c.freeform_tags}}
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = var.enable_compartments_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

resource "oci_identity_compartment" "level_3" {
  for_each = {for c in local.level_3 : c.key => {name: c.name, 
                                                 description: c.description,
                                                 parent_id: c.parent_id,
                                                 defined_tags: c.defined_tags,
                                                 freeform_tags: c.freeform_tags}}
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = var.enable_compartments_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

resource "oci_identity_compartment" "level_4" {
  for_each = {for c in local.level_4 : c.key => {name: c.name, 
                                                 description: c.description,
                                                 parent_id: c.parent_id,
                                                 defined_tags: c.defined_tags,
                                                 freeform_tags: c.freeform_tags}}
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = var.enable_compartments_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

resource "oci_identity_compartment" "level_5" {
  for_each = {for c in local.level_5 : c.key => {name: c.name, 
                                                 description: c.description,
                                                 parent_id: c.parent_id,
                                                 defined_tags: c.defined_tags,
                                                 freeform_tags: c.freeform_tags}}
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = var.enable_compartments_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

resource "oci_identity_compartment" "level_6" {
  for_each = {for c in local.level_6 : c.key => {name: c.name, 
                                                 description: c.description,
                                                 parent_id: c.parent_id,
                                                 defined_tags: c.defined_tags,
                                                 freeform_tags: c.freeform_tags}}
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = var.enable_compartments_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

/*
module "lz_level_1_compartments" {
  source = "./modules/iam/compartments"
  compartments = {for k, v in var.compartments : k => {name: v.name, 
                                                       description: v.description, 
                                                       parent_id: v.parent_id, 
                                                       enable_delete: var.enable_compartments_delete, 
                                                       defined_tags: v.defined_tags, 
                                                       freeform_tags: v.freeform_tags}
  }
}

module "lz_level_2_compartments" {
  source = "./modules/iam/compartments"
  compartments = {for c in local.level_2 : c.key => {name: c.name, 
                                                     description: c.description,
                                                     parent_id: c.parent_id,
                                                     enable_delete: var.enable_compartments_delete,
                                                     defined_tags: c.defined_tags,
                                                     freeform_tags: c.freeform_tags}
  }
}  

module "lz_level_3_compartments" {
  source = "./modules/iam/compartments"
  compartments = {for c in local.level_3 : c.key => {name: c.name, 
                                                     description: c.description,
                                                     parent_id: c.parent_id,
                                                     enable_delete: var.enable_compartments_delete,
                                                     defined_tags: c.defined_tags,
                                                     freeform_tags: c.freeform_tags}
  }
}  

module "lz_level_4_compartments" {
  source = "./modules/iam/compartments"
  compartments = {for c in local.level_4 : c.key => {name: c.name, 
                                                     description: c.description,
                                                     parent_id: c.parent_id,
                                                     enable_delete: var.enable_compartments_delete,
                                                     defined_tags: c.defined_tags,
                                                     freeform_tags: c.freeform_tags}
  }
}

module "lz_level_5_compartments" {
  source = "./modules/iam/compartments"
  compartments = {for c in local.level_5 : c.key => {name: c.name, 
                                                     description: c.description,
                                                     parent_id: c.parent_id,
                                                     enable_delete: var.enable_compartments_delete,
                                                     defined_tags: c.defined_tags,
                                                     freeform_tags: c.freeform_tags}
  }
}
*/