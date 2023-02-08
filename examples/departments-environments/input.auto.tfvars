# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#--------------------------------------------------------------------------------------------------------------
# The compartments variable defines a Terraform object describing an arbitrary compartments topology.
# This object is passed into a generic Terraform module that creates any compartments topology in OCI.
# The object defines sub-objects indexed by uppercased strings, like TOP-CMP, NETWORK-CMP, SECURITY-CMP, etc.
# These strings can actually be any random strings, but once defined they MUST NOT BE CHANGED, 
# or Terraform will try to destroy and recreate the compartments.
#---------------------------------------------------------------------------------------------------------------

compartments = { 
  ORG1-SHD-CMP : { 
    name : "org1-shd-cmp", 
    description : "Network, Storage, Security Services compartment", 
    parent_id : "ocid1.compartment.oc1..aaaaaaaa4xzo6svc5zoclp3syjwluimamqsgulurpvsdankhamussi675zla"
    defined_tags : null, 
    freeform_tags : {"cislz":"org1",
                     "cislz-cmp-type":"network,security",
                     "cislz-consumer-groups-security":"org1-sharedinfra-admin-group",
                     "cislz-consumer-groups-network":"org1-sharedinfra-admin-group",
                     "cislz-consumer-groups-read":"org1-sharedinfra-read-group",
                     "cislz-consumer-groups-application":"org1-cmr-prod-admin-group",
                     "cislz-consumer-groups-database":"org1-cor-prod-admin-group"},
    children : {}
  },
  ORG1-CMR-CMP : { 
    name : "org1-cmr-cmp", 
    description : "Commercial compartment", 
    #parent_id : "<ENTER THE OCID OF THE PARENT COMPARTMENT>", 
    parent_id : "ocid1.compartment.oc1..aaaaaaaa4xzo6svc5zoclp3syjwluimamqsgulurpvsdankhamussi675zla"
    defined_tags : null, 
    freeform_tags : null,
    children : {
      ORG1-CMR-PRD-CMP : { 
        name : "org1-cmr-prd-cmp", 
        description : "Commercial Production compartment",  
        defined_tags : null, 
        freeform_tags : {"cislz":"org1",
                         "cislz-cmp-type":"application,database",
                         "cislz-consumer-groups-application":"org1-cmr-prd-admin-group",
                         "cislz-consumer-groups-database":"org1-cmr-prd-admin-group"},
        children : {}
      },
      ORG1-CMR-TST-CMP : { 
        name : "org1-cmr-tst-cmp", 
        description : "Commercial Test compartment",  
        defined_tags : null, 
        freeform_tags : {"cislz":"org1",
                         "cislz-cmp-type":"application,database",
                         "cislz-consumer-groups-application":"org1-cmr-tst-admin-group",
                         "cislz-consumer-groups-database":"org1-cmr-tst-admin-group"},
        children : {}
      }
    }
  },
  ORG1-COR-CMP : { 
    name : "org1-cor-cmp", 
    description : "Corporate compartment", 
    #parent_id : "<ENTER THE OCID OF THE PARENT COMPARTMENT>", 
    parent_id : "ocid1.compartment.oc1..aaaaaaaa4xzo6svc5zoclp3syjwluimamqsgulurpvsdankhamussi675zla"
    defined_tags : null, 
    freeform_tags : null,
    children : {
      ORG1-COR-PRD-CMP : { 
        name : "org1-cor-prd-cmp", 
        description : "Corporate Production compartment",  
        defined_tags : null, 
        freeform_tags : null,
        children : {}
      },
      ORG1-COR-TST-CMP : { 
        name : "org1-cor-tst-cmp", 
        description : "Corporate Test compartment",  
        defined_tags : {}, 
        freeform_tags : null,
        children : {}
      }
    }
  }
}