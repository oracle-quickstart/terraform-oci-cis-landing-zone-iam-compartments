# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#--------------------------------------------------------------------------------------------------------------
# The compartments variable defines a Terraform object describing CIS Landing Zone compartments topology.
# This object is passed into a generic Terraform module that creates any compartments topology in OCI.
# The object defines sub-objects indexed by uppercased strings, like TOP-CMP, NETWORK-CMP, SECURITY-CMP, etc.
# These strings can actually be any random string, but once defined they MUST NOT BE CHANGED, 
# or Terraform will try to destroy and recreate the compartments.
#---------------------------------------------------------------------------------------------------------------

compartments = { 
  TOP-CMP : { 
    name : "cislz-top-cmp", 
    description : "CIS Landing Zone enclosing compartment", 
    parent_id : "<ENTER THE OCID OF THE PARENT COMPARTMENT>", 
    defined_tags : null, 
    freeform_tags : {"cis-landing-zone":"quickstart","cmp-type":"enclosing"},
    children : {
      NETWORK-CMP : { 
        name : "cislz-network-cmp", 
        description : "CIS Landing Zone Network compartment", 
        defined_tags : null, 
        freeform_tags : {"cis-landing-zone":"quickstart","cmp-type":"network"}, 
        children : {}
      },
      SECURITY-CMP : { 
        name : "cislz-security-cmp", 
        description : "CIS Landing Zone Security compartment", 
        defined_tags : null, 
        freeform_tags : {"cis-landing-zone":"quickstart","cmp-type":"security"},
        children : {}
      },
      APP-CMP : { 
        name : "cislz-application-cmp", 
        description : "CIS Landing Zone Application compartment", 
        defined_tags : null, 
        freeform_tags : {"cis-landing-zone":"quickstart","cmp-type":"application"},
        children : {}
      },
      DB-CMP : { 
        name : "cislz-database-cmp", 
        description : "CIS Landing Zone Database compartment", 
        defined_tags : null, 
        freeform_tags : {"cis-landing-zone":"quickstart","cmp-type":"database"},
        children : {}
      },
      EXACS-CMP : { 
        name : "cislz-exacs-cmp", 
        description : "CIS Landing Zone Exadata Cloud Service compartment",  
        defined_tags : null, 
        freeform_tags : {"cis-landing-zone":"quickstart","cmp-type":"exainfra"},
        children : {}
      } 
    }
  }
}