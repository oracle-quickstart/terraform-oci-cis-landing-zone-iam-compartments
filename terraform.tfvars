# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

tenancy_ocid         = "ocid1.tenancy.oc1..aaaaaaaa3pbmdv223ttwv4wjvmn4jvcw4gxc3skym74itutnnoisg5zrbnuq" #cislzground
user_ocid            = "ocid1.user.oc1..aaaaaaaajhy4l62q5y2thovx4em2ttq3c35ff3hs3czsp6c7p45exoczufia" #andre.correa@oracle.com local
fingerprint          = "47:dd:e6:92:c8:06:90:84:03:0f:94:30:8a:9d:48:2a" #tenant admin
private_key_path     = "./private_key_cislzground.pem"
private_key_password = ""
home_region_name     = "us-ashburn-1"

cmp_name_prefix = "super"

advanced_compartments = { TOP-CMP : { name : "stacks-landing-zone-top-cmp", description : "CIS Landing Zone top compartment", parent_id : "ocid1.compartment.oc1..aaaaaaaaxesrxkmzwuvi2sf54thegmojwexca3sz63wqr6h7xgdz7ivves2a", defined_tags : {}, freeform_tags : {"type":"enc"},
                        children : {
                            NETWORK-CMP : { name : "shared-network-cmp", description : "CIS Landing Zone Shared network compartment", defined_tags : {}, freeform_tags : {"type":"net"}, 
                                children : {}
                            },
                            SECURITY-CMP : { name : "shared-security-cmp", description : "CIS Landing Zone Shared security compartment", defined_tags : {}, freeform_tags : {"type":"sec"},
                                children : {}
                            },
                            APP-CMP : { name : "application-cmp", description : "CIS Landing Zone Application compartment", defined_tags : {}, freeform_tags : {"type":"app"},
                                children : {
                                    APP-DEV-CMP : { name : "application-dev-cmp", description : "CIS Landing Zone Application Development compartment", defined_tags : {}, freeform_tags : {"type":"app-dev"},
                                        children : {}
                                    },
                                    APP-PRD-CMP : { name : "application-prd-cmp", description : "CIS Landing Zone Application Production compartment", defined_tags : {}, freeform_tags : {"type":"app-prd"},
                                        children : {}
                                    }
                                }
                            },
                            DB-CMP : { name : "database-cmp", description : "CIS Landing Zone Database compartment", defined_tags : {}, freeform_tags : {"type":"db"},
                                children : {
                                    DB-DEV-CMP : { name : "database-dev-cmp", description : "CIS Landing Zone Database Development compartment", defined_tags : {}, freeform_tags : {"type":"db-dev"},
                                        children : {}
                                    },
                                    DB-PRD-CMP : { name : "database-prd-cmp", description : "CIS Landing Zone Database Production compartment",  defined_tags : {}, freeform_tags : {"type":"db-prd"},
                                        children : {}
                                    }
                                }
                            },
                            EXACS-CMP : { name : "exacs-cmp", description : "CIS Landing Zone Exadata CS compartment",  defined_tags : {}, freeform_tags : {"type":"exa"},
                                children : {}
                            } 
                        }
                    }
}

use_enclosing_compartment = true

enable_quickstart = false

divisions = ["hr"]
lifecycle_envs = ["prod","dev"]
applications = ["ebis","psft"]
enable_web_layer_for = ["ebis"]
enable_midtier_layer_for = ["ebis","psft"]