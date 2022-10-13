# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#--------------------------------------------------------------------------------------------------------------
# The compartments variable defines a Terraform object describing a compartments topology with divisions (HR),
# lifecycle environments (DEV, PROD) and workloads (WORKLOAD-1, WORKLOAD-2).
# This object is passed into a generic Terraform module that creates any compartments topology in OCI.
# The object defines sub-objects indexed by uppercased strings, like SHARED-CMP, HR-CMP, DEV-CMP, etc.
# These strings can actually be any random string, but once defined they MUST NOT BE CHANGED, 
# or Terraform will try to destroy and recreate the compartments.
#---------------------------------------------------------------------------------------------------------------

compartments = { 
  SHARED-CMP : { 
    name : "shared-cmp", 
    description : "Network, Storage, Security Services shared compartment", 
    parent_id : "<ENTER THE OCID OF THE PARENT COMPARTMENT>", 
    defined_tags : null, 
    freeform_tags : {"cmp-type":"shared"},
    children : {}
  },
  HR-CMP : { 
    name : "hr-cmp", 
    description : "HR Department compartment", 
    parent_id : "<ENTER THE OCID OF THE PARENT COMPARTMENT>", 
    defined_tags : null, 
    freeform_tags : {"cmp-type":"department"},
    children : {
      DEV-CMP : {
        name : "dev-cmp", 
        description : "HR Development compartment",  
        defined_tags : null, 
        freeform_tags : {"cmp-type":"development"},
        children : { 
          WORKLOAD-1-CMP : { 
            name : "workload-1-cmp", 
            description : "Workload 1 Development compartment",  
            defined_tags : null, 
            freeform_tags : {"cmp-type":"workload"},
            children : {
              APP-CMP : { 
                name : "application-cmp", 
                description : "Application (mid-tier) Development compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"application"},
                children : {}
              },
              DB-CMP : { 
                name : "database-cmp", 
                description : "Database Development compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"database"},
                children : {}
              }
            }
          },
          WORKLOAD-2-CMP : { 
            name : "workload-2-cmp", 
            description : "Workload 2 Development compartment",  
            defined_tags : null, 
            freeform_tags : {"cmp-type":"workload"},
            children : {
              APP-CMP : { 
                name : "midtier-cmp", 
                description : "Application (mid-tier) Development compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"application"},
                children : {}
              },
              DB-CMP : { 
                name : "database-cmp", 
                description : "Database Development compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"database"},
                children : {}
              }
              MGMT-CMP : { 
                name : "mgmt-cmp", 
                description : "Management Development compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"management"},
                children : {}
              }
            }
          }
        }
      },
      PROD-CMP : { 
        name : "prod-cmp", 
        description : "HR Production compartment",  
        defined_tags : null, 
        freeform_tags : {"cmp-type":"production"},
        children : { 
          WORKLOAD-1-CMP : { 
            name : "workload-1-cmp", 
            description : "Workload 1 Production compartment",  
            defined_tags : null, 
            freeform_tags : {"cmp-type":"workload"},
            children : {
              APP-CMP : { 
                name : "midtier-cmp", 
                description : "Application (mid-tier) Production compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"application"},
                children : {}
              },
              DB-CMP : { 
                name : "database-cmp", 
                description : "Database Production compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"database"},
                children : {}
              }
            }
          },
          WORKLOAD-2-CMP : { 
            name : "workload-2-cmp", 
            description : "Workload 2 Production compartment",  
            defined_tags : null, 
            freeform_tags : {"cmp-type":"workload"},
            children : {
              APP-CMP : { 
                name : "midtier-cmp", 
                description : "Application (mid-tier) Production compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"application"},
                children : {}
              },
              DB-CMP : { 
                name : "database-cmp", 
                description : "Database Production compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"database"},
                children : {}
              }
              MGMT-CMP : { 
                name : "mgmt-cmp", 
                description : "Management Production compartment",  
                defined_tags : null, 
                freeform_tags : {"cmp-type":"management"},
                children : {}
              }
            }
          }
        }
      }
    }
  }
}