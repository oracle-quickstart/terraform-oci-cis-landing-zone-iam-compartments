# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
/* 
tenancy_id           = "<ENTER TENANCY OCID>"
user_id              = "<ENTER USER OCID>"
fingerprint          = "<ENTER USER FINGERPRINT>"
private_key_path     = "<ENTER USER PRIVATE KEY PATH>"
private_key_password = ""
home_region          = "<ENTER HOME REGION NAME>" # Few examples: us-ashburn-1, us_phoenix-1, sa-saopaulo-1. For a full list, see https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm
 */
tenancy_id           = "ocid1.tenancy.oc1..aaaaaaaa3pbmdv223ttwv4wjvmn4jvcw4gxc3skym74itutnnoisg5zrbnuq" #cislzground
user_id              = "ocid1.user.oc1..aaaaaaaajhy4l62q5y2thovx4em2ttq3c35ff3hs3czsp6c7p45exoczufia" #andre.correa@oracle.com local
fingerprint          = "47:dd:e6:92:c8:06:90:84:03:0f:94:30:8a:9d:48:2a" #tenant admin
private_key_path     = "../../private_key_cislzground.pem"
private_key_password = ""
home_region          = "us-ashburn-1"

compartments = { 
    SHARED-CMP : { name : "shared-cmp", description : "Network, Storage, Security Services shared compartment", parent_id : "<ENTER THE OCID OF THE PARENT COMPARTMENT>", defined_tags : {}, freeform_tags : {"cmp-type":"enclosing"},
        children : {}
    },
    HR-CMP : { name : "hr-cmp", description : "HR Department compartment", parent_id : "<ENTER THE OCID OF THE PARENT COMPARTMENT>", defined_tags : {}, freeform_tags : {"cmp-type":"department"},
        children : {
            DEV-CMP : { name : "dev-cmp", description : "HR Development compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"development"},
                children : { 
                    WORKLOAD-1-CMP : { name : "workload-1-cmp", description : "Workload 1 Development compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"workload"},
                        children : {
                            APP-CMP : { name : "application-cmp", description : "Application (mid-tier) Development compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"application"},
                                children : {}
                            },
                            DB-CMP : { name : "database-cmp", description : "Database Development compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"database"},
                                children : {}
                            }
                        }
                    },
                    WORKLOAD-2-CMP : { name : "workload-2-cmp", description : "Workload 2 Development compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"workload"},
                        children : {
                            APP-CMP : { name : "midtier-cmp", description : "Application (mid-tier) Development compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"application"},
                                children : {}
                            },
                            DB-CMP : { name : "database-cmp", description : "Database Development compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"database"},
                                children : {}
                            }
                            MGMT-CMP : { name : "mgmt-cmp", description : "Management Development compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"management"},
                                children : {}
                            }
                        }
                    }
                }
            },
            PROD-CMP : { name : "prod-cmp", description : "HR Production compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"production"},
                children : { 
                    WORKLOAD-1-CMP : { name : "workload-1-cmp", description : "Workload 1 Production compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"workload"},
                        children : {
                            APP-CMP : { name : "midtier-cmp", description : "Application (mid-tier) Production compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"application"},
                                children : {}
                            },
                            DB-CMP : { name : "database-cmp", description : "Database Production compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"database"},
                                children : {}
                            }
                        }
                    },
                    WORKLOAD-2-CMP : { name : "workload-2-cmp", description : "Workload 2 Production compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"workload"},
                        children : {
                            APP-CMP : { name : "midtier-cmp", description : "Application (mid-tier) Production compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"application"},
                                children : {}
                            },
                            DB-CMP : { name : "database-cmp", description : "Database Production compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"database"},
                                children : {}
                            }
                            MGMT-CMP : { name : "mgmt-cmp", description : "Management Production compartment",  defined_tags : {}, freeform_tags : {"cmp-type":"management"},
                                children : {}
                            }
                        }
                    }
                }
            }
        }
    }
}