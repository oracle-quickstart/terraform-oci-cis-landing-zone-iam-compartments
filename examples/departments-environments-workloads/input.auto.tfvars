# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#--------------------------------------------------------------------------------------------------------------
# The compartments variable defines a Terraform object describing a compartments topology with divisions (HR),
# lifecycle environments (DEV, PROD) and workloads (WORKLOAD-1, WORKLOAD-2).
# This object is passed into a generic Terraform module that creates any compartments topology in OCI.
# The object defines sub-objects indexed by uppercased strings, like SHARED-CMP, HR-CMP, DEV-CMP, etc.
# These strings can actually be any random strings, but once defined they MUST NOT BE CHANGED, 
# or Terraform will try to destroy and recreate the compartments.
#---------------------------------------------------------------------------------------------------------------

compartments = { 
  SHARED-CMP : { 
    name : "workload-example-shared-cmp", 
    description : "Network and Security services shared compartment", 
    #parent_id : "<ENTER THE OCID OF THE PARENT COMPARTMENT>", 
    parent_id : "ocid1.compartment.oc1..aaaaaaaa4xzo6svc5zoclp3syjwluimamqsgulurpvsdankhamussi675zla"
    defined_tags : null, 
    freeform_tags : {"cislz":"workload-example",
                     "cislz-cmp-type":"network,security",
                     "cislz-consumer-groups-network":"shared-net-admin-group",
                     "cislz-consumer-groups-security":"shared-sec-admin-group",
                     "cislz-consumer-groups-application":"hr-dev-app-admin-group,hr-prd-app-admin-group",
                     "cislz-consumer-groups-database":"hr-dev-db-admin-group,hr-prd-db-admin-group"},
    children : {}
  },
  HR-CMP : { 
    name : "workload-example-hr-cmp", 
    description : "HR Department compartment", 
    #parent_id : "<ENTER THE OCID OF THE PARENT COMPARTMENT>", 
    parent_id : "ocid1.compartment.oc1..aaaaaaaa4xzo6svc5zoclp3syjwluimamqsgulurpvsdankhamussi675zla"
    defined_tags : null, 
    freeform_tags : null,
    children : {
      DEV-CMP : {
        name : "dev-cmp", 
        description : "HR Development compartment",  
        defined_tags : null, 
        freeform_tags : null,
        children : { 
          HR-DEV-WORKLOAD-1-CMP : { 
            name : "workload-1-cmp", 
            description : "Workload 1 Development compartment",  
            defined_tags : null, 
            freeform_tags : null,
            children : {
              HR-DEV-WORKLOAD-1-APP-CMP : { 
                name : "application-cmp", 
                description : "Application (mid-tier) Development compartment",  
                defined_tags : null, 
                freeform_tags : {"cislz":"workload-example",
                                 "cislz-cmp-type":"application",
                                 "cislz-consumer-groups-application":"hr-dev-app-admin-group",
                                 "cislz-consumer-groups-database":"hr-dev-db-admin-group"},
                children : {}
              },
              HR-DEV-WORKLOAD-1-DB-CMP : { 
                name : "database-cmp", 
                description : "Database Development compartment",  
                defined_tags : null, 
                freeform_tags : {"cislz":"workload-example",
                                 "cislz-cmp-type":"database",
                                 "cislz-consumer-groups-database":"hr-dev-db-admin-group"},
                children : {}
              }
            }
          },
          HR-DEV-WORKLOAD-2-CMP : { 
            name : "workload-2-cmp", 
            description : "Workload 2 Development compartment",  
            defined_tags : null, 
            freeform_tags : null,
            children : {
              HR-DEV-WORKLOAD-2-APP-CMP : { 
                name : "midtier-cmp", 
                description : "Application (mid-tier) Development compartment",  
                defined_tags : null, 
                freeform_tags : {"cislz":"workload-example",
                                 "cislz-cmp-type":"application",
                                 "cislz-consumer-groups-application":"hr-dev-app-admin-group",
                                 "cislz-consumer-groups-database":"hr-dev-db-admin-group"},
                children : {}
              },
              HR-DEV-WORKLOAD-2-DB-CMP : { 
                name : "database-cmp", 
                description : "Database Development compartment",  
                defined_tags : null, 
                freeform_tags : {"cislz":"workload-example",
                                 "cislz-cmp-type":"database",
                                 "cislz-consumer-groups-database":"hr-dev-db-admin-group"},
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
        freeform_tags : null,
        children : { 
          HR-PROD-WORKLOAD-1-CMP : { 
            name : "workload-1-cmp", 
            description : "Workload 1 Production compartment",  
            defined_tags : null, 
            freeform_tags : null,
            children : {
              HR-PROD-WORKLOAD-1-APP-CMP : { 
                name : "midtier-cmp", 
                description : "Application (mid-tier) Production compartment",  
                defined_tags : null, 
                freeform_tags : {"cislz":"workload-example",
                                 "cislz-cmp-type":"application",
                                 "cislz-consumer-groups-application":"hr-prd-app-admin-group",
                                 "cislz-consumer-groups-database":"hr-prd-db-admin-group"},
                children : {}
              },
              HR-PROD-WORKLOAD-1-DB-CMP : { 
                name : "database-cmp", 
                description : "Database Production compartment",  
                defined_tags : null, 
                freeform_tags : {"cislz":"workload-example",
                                 "cislz-cmp-type":"database",
                                 "cislz-consumer-groups-database":"hr-prd-db-admin-group"},
                children : {}
              }
            }
          },
          HR-PROD-WORKLOAD-2-CMP : { 
            name : "workload-2-cmp", 
            description : "Workload 2 Production compartment",  
            defined_tags : null, 
            freeform_tags : null,
            children : {
              HR-PROD-WORKLOAD-2-APP-CMP : { 
                name : "midtier-cmp", 
                description : "Application (mid-tier) Production compartment",  
                defined_tags : null, 
                freeform_tags : {"cislz":"workload-example",
                                 "cislz-cmp-type":"application",
                                 "cislz-consumer-groups-application":"hr-prd-app-admin-group",
                                 "cislz-consumer-groups-database":"hr-prd-db-admin-group"},
                children : {}
              },
              HR-PROD-WORKLOAD-2-DB-CMP : { 
                name : "database-cmp", 
                description : "Database Production compartment",  
                defined_tags : null, 
                freeform_tags : {"cislz":"workload-example",
                                 "cislz-cmp-type":"database",
                                 "cislz-consumer-groups-database":"hr-prd-db-admin-group"},
                children : {}
              }
            }
          }
        }
      }
    }
  }
}