# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

### This Terraform configuration manages Landing Zone core compartments in the tenancy.

locals {
  
  defined_tags  = null
  freeform_tags = {"cis-landing-zone" : var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-core" : "core"}

  #-----------------------------------------------------------
  #----- Security compartment
  #-----------------------------------------------------------
  security_compartment_key = "${var.cmp_name_prefix}-security-cmp"
  default_security_compartment_name = "security-cmp"
  security_compartment_name = var.security_compartment_name != null ? var.security_compartment_name : (var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${local.default_security_compartment_name}" : local.default_security_compartment_name)
  
  security_compartment = var.enable_security_compartment ? {
    (local.security_compartment_key) = {
      parent_id     = local.enclosing_compartment_id
      name          = local.security_compartment_name
      description   = "CIS Landing Zone compartment for all security related resources: vaults, topics, notifications, logging, scanning, and others."
      enable_delete = var.enable_compartments_delete
      defined_tags  = local.defined_tags
      freeform_tags = merge(local.freeform_tags,{"type":"sec"})
    }
  } : {}

  #-----------------------------------------------------------
  #----- Network compartment
  #-----------------------------------------------------------  
  network_compartment_key  = "${var.cmp_name_prefix}-network-cmp"
  default_network_compartment_name = "network-cmp"
  network_compartment_name = var.network_compartment_name != null ? var.network_compartment_name : (var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${local.default_network_compartment_name}" : local.default_network_compartment_name)
  
  network_compartment = var.enable_network_compartment ? { 
    (local.network_compartment_key) = {
      parent_id     = local.enclosing_compartment_id
      name          = local.network_compartment_name
      description   = "CIS Landing Zone compartment for all network related resources: VCNs, subnets, network gateways, security lists, NSGs, load balancers, VNICs, and others."
      enable_delete = var.enable_compartments_delete
      defined_tags  = local.defined_tags
      freeform_tags = merge(local.freeform_tags,{"type":"net"})
    }
  } : {}

  #-----------------------------------------------------------
  #----- Application compartment
  #-----------------------------------------------------------
  appdev_compartment_key   = "${var.cmp_name_prefix}-appdev-cmp"
  default_appdev_compartment_name = "appdev-cmp"
  appdev_compartment_name = var.appdev_compartment_name != null ? var.appdev_compartment_name : (var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${local.default_appdev_compartment_name}" : local.default_appdev_compartment_name)
  
  appdev_compartment = var.enable_appdev_compartment ? {  
    (local.appdev_compartment_key) = {
      parent_id     = local.enclosing_compartment_id
      name          = local.appdev_compartment_name
      description   = "CIS Landing Zone compartment for all resources related to application development: compute instances, storage, functions, OKE, API Gateway, streaming, and others."
      enable_delete = var.enable_compartments_delete
      defined_tags  = local.defined_tags
      freeform_tags = merge(local.freeform_tags,{"type":"app"})
    }
  } : {}

  #-----------------------------------------------------------
  #----- Application compartment
  #-----------------------------------------------------------
  database_compartment_key = "${var.cmp_name_prefix}-database-cmp"
  default_database_compartment_name = "database-cmp"
  database_compartment_name = var.database_compartment_name != null ? var.database_compartment_name : (var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${local.default_database_compartment_name}" : local.default_database_compartment_name)
  
  database_compartment = var.enable_database_compartment ? {
    (local.database_compartment_key) = {
      parent_id     = local.enclosing_compartment_id
      name          = local.database_compartment_name
      description   = "CIS Landing Zone compartment for all database related resources."
      enable_delete = var.enable_compartments_delete
      defined_tags  = local.defined_tags
      freeform_tags = merge(local.freeform_tags,{"type":"db"})
    }
  } : {}

  #-----------------------------------------------------------
  #----- ExaCS infra compartment
  #-----------------------------------------------------------
  exainfra_compartment_key = "${var.cmp_name_prefix}-exainfra-cmp"
  default_exainfra_compartment_name = "exainfra-cmp"
  exainfra_compartment_name = var.exainfra_compartment_name != null ? var.exainfra_compartment_name : (var.cmp_name_prefix != null ? "${var.cmp_name_prefix}-${local.default_exainfra_compartment_name}" : local.default_exainfra_compartment_name)
  
  exainfra_compartment = var.enable_exainfra_compartment ? {
    (local.exainfra_compartment_key) = {
      parent_id     = local.enclosing_compartment_id
      name          = local.exainfra_compartment_name
      description   = "CIS Landing Zone compartment for Exadata Cloud Service infrastructure."
      enable_delete = var.enable_compartments_delete
      defined_tags  = local.defined_tags
      freeform_tags = merge(local.freeform_tags,{"type":"exa"})
    }
  } : {}

  #-- Landing Zone Quick Start compartments
  core_cmps = var.enable_core && !var.extend_landing_zone_to_new_region ? merge(local.security_compartment, local.network_compartment, local.appdev_compartment, local.database_compartment, local.exainfra_compartment) : {}
}

resource "oci_identity_compartment" "these" {
  for_each =  local.core_cmps
    compartment_id = each.value.parent_id
    name           = each.value.name
    description    = each.value.description
    enable_delete  = each.value.enable_delete
    defined_tags   = each.value.defined_tags
    freeform_tags  = each.value.freeform_tags
}

/* module "lz_top_compartment" {
  count     = !var.extend_landing_zone_to_new_region ? 1 : 0
  source    = "../modules/iam/compartments"
  compartments = local.enclosing_compartment
}

module "lz_compartments" {
  count     = !var.extend_landing_zone_to_new_region ? 1 : 0
  source    = "../modules/iam/compartments"
  compartments = local.core_cmps
} */


