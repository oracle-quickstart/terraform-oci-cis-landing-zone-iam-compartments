# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#--------------------------------------------------------------------------------------------------------------
# The compartments variable defines a Terraform object describing CIS Landing Zone compartments topology.
# This object is passed into a generic Terraform module that creates any compartments topology in OCI.
# The object defines sub-objects indexed by uppercased strings, like TOP-CMP, NETWORK-CMP, SECURITY-CMP, etc.
# These strings can actually be any random strings, but once defined they MUST NOT BE CHANGED, 
# or Terraform will try to destroy and recreate the compartments.
#---------------------------------------------------------------------------------------------------------------

compartments = { 
  TOP-CMP : { 
    name : "vision-top-cmp", 
    description : "CIS Landing Zone enclosing compartment", 
    parent_id : "ocid1.compartment.oc1..aaaaaaaa4xzo6svc5zoclp3syjwluimamqsgulurpvsdankhamussi675zla",
    defined_tags : null, 
    freeform_tags : {
      "cislz":"vision",
      "cislz-cmp-type":"enclosing",
      "cislz-consumer-groups-security":"vision-security-admin-group",
      "cislz-consumer-groups-application":"vision-app-admin-group",
      "cislz-consumer-groups-iam":"vision-iam-admin-group"
    },
    children : {
      NETWORK-CMP : { 
        name : "vision-network-cmp", 
        description : "CIS Landing Zone Network compartment", 
        defined_tags : null, 
        freeform_tags : {
          "cislz":"vision",
          "cislz-cmp-type":"network",
          "cislz-consumer-groups-security":"vision-security-admin-group",
          "cislz-consumer-groups-application":"vision-app-admin-group",
          "cislz-consumer-groups-database":"vision-database-admin-group",
          "cislz-consumer-groups-network":"vision-network-admin-group",
          "cislz-consumer-groups-storage":"vision-storage-admin-group",
          "cislz-consumer-groups-exainfra":"vision-exainfra-admin-group"
        }, 
        children : {}
      },
      SECURITY-CMP : { 
        name : "vision-security-cmp", 
        description : "CIS Landing Zone Security compartment", 
        defined_tags : null, 
        freeform_tags : {
          "cislz":"vision",
          "cislz-cmp-type":"security",
          "cislz-consumer-groups-security":"vision-security-admin-group",
          "cislz-consumer-groups-application":"vision-app-admin-group,vision-db-admin-group",
          "cislz-consumer-groups-database":"vision-database-admin-group",
          "cislz-consumer-groups-network":"vision-network-admin-group",
          "cislz-consumer-groups-storage":"vision-storage-admin-group",
          "cislz-consumer-groups-exainfra":"vision-exainfra-admin-group"
        },
        children : {}
      },
      APP-CMP : { 
        name : "vision-application-cmp", 
        description : "CIS Landing Zone Application compartment", 
        defined_tags : null, 
        freeform_tags : {
          "cislz":"vision",
          "cislz-cmp-type":"application",
          "cislz-consumer-groups-security":"vision-security-admin-group",
          "cislz-consumer-groups-application":"vision-app-admin-group",
          "cislz-consumer-groups-database":"vision-database-admin-group",
          "cislz-consumer-groups-network":"vision-network-admin-group",
          "cislz-consumer-groups-storage":"vision-storage-admin-group",
          "cislz-consumer-groups-exainfra":"vision-exainfra-admin-group"
        },
        children : {}
      },
      DB-CMP : { 
        name : "vision-database-cmp", 
        description : "CIS Landing Zone Database compartment", 
        defined_tags : null, 
        freeform_tags : {
          "cislz":"vision",
          "cislz-cmp-type":"database",
          "cislz-consumer-groups-security":"vision-security-admin-group",
          "cislz-consumer-groups-application":"vision-app-admin-group",
          "cislz-consumer-groups-database":"vision-database-admin-group",
          "cislz-consumer-groups-network":"vision-network-admin-group",
          "cislz-consumer-groups-storage":"vision-storage-admin-group",
          "cislz-consumer-groups-exainfra":"vision-exainfra-admin-group"
        },
        children : {}
      },
      EXACS-CMP : { 
        name : "vision-exainfra-cmp", 
        description : "CIS Landing Zone Exadata Cloud Service compartment",  
        defined_tags : null, 
        freeform_tags : {
          "cislz":"vision",
          "cislz-cmp-type":"exainfra",
          "cislz-consumer-groups-security":"vision-security-admin-group",
          "cislz-consumer-groups-application":"vision-app-admin-group",
          "cislz-consumer-groups-database":"vision-database-admin-group",
          "cislz-consumer-groups-network":"vision-network-admin-group",
          "cislz-consumer-groups-storage":"vision-storage-admin-group",
          "cislz-consumer-groups-exainfra":"vision-exainfra-admin-group"
        },
        children : {}
      } 
    }
  }
}