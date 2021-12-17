# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

tenancy_ocid         = "<ENTER TENANCY OCID>"
user_ocid            = "<ENTER USER OCID>"
fingerprint          = "<ENTER USER FINGERPRINT>"
private_key_path     = "<ENTER USER PRIVATE KEY PATH>"
private_key_password = ""
home_region_name     = "us-ashburn-1" # Few examples: us-ashburn-1, us_phoenix-1, sa-saopaulo-1. For a full list, see https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm

compartments = {    SHARED-CMP : { name : "shared-cmp", description : "Network, Storage, Security Services compartment", parent_id : "<ENTER PARENT CMP OCID>", defined_tags : {}, freeform_tags : {},
                        children : {}
                    },
                    BU-1-CMP : { name : "business-unit-1-cmp", description : "Business Unit 1 compartment", parent_id : "<ENTER PARENT CMP OCID>", defined_tags : {}, freeform_tags : {},
                        children : {
                            DB-CMP : { name : "db-cmp", description : "Database compartment",  defined_tags : {}, freeform_tags : {},
                                children : {}
                            },
                            EXAINFRA-CMP : { name : "exainfra-cmp", description : "Exadata Infrastructure compartment",  defined_tags : {}, freeform_tags : {},
                                children : {}
                            }
                        }
                    },
                    BU-2-CMP : { name : "business-unit-2-cmp", description : "Business Unit 2 compartment", parent_id : "<ENTER PARENT CMP OCID>", defined_tags : {}, freeform_tags : {},
                        children : {
                            APP-CMP : { name : "app-cmp", description : "Application compartment",  defined_tags : {}, freeform_tags : {},
                                children : {}
                            },
                            DB-CMP : { name : "db-cmp", description : "Database compartment",  defined_tags : {}, freeform_tags : {},
                                children : {}
                            }
                        }
                    },
                    BU-3-CMP : { name : "business-unit-3-cmp", description : "Business Unit 3 compartment", parent_id : "<ENTER PARENT CMP OCID>", defined_tags : {}, freeform_tags : {},
                        children : {
                            NETWORK-CMP : { name : "network-cmp", description : "Network compartment",  defined_tags : {}, freeform_tags : {},
                                children : {}
                            },
                            SECURITY-CMP : { name : "security-cmp", description : "Security compartment",  defined_tags : {}, freeform_tags : {},
                                children : {}
                            },
                            APP-CMP : { name : "app-cmp", description : "Application compartment",  defined_tags : {}, freeform_tags : {},
                                children : {}
                            },
                            DB-CMP : { name : "db-cmp", description : "Database compartment",  defined_tags : {}, freeform_tags : {},
                                children : {}
                            }
                        }
                    }
}