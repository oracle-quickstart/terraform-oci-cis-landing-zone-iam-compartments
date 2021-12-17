# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

tenancy_ocid         = "<ENTER TENANCY OCID>"
user_ocid            = "<ENTER USER OCID>"
fingerprint          = "<ENTER USER FINGERPRINT>"
private_key_path     = "<ENTER USER PRIVATE KEY PATH>"
private_key_password = ""

compartments = { TOP-CMP : { name : "landing-zone-top-cmp", description : "Landing Zone top compartment", parent_id : "ocid1.compartment.oc1..aaaaaaaaxesrxkmzwuvi2sf54thegmojwexca3sz63wqr6h7xgdz7ivves2a", defined_tags : {}, freeform_tags : {},
                        children : {
                            NETWORK-CMP : { name : "shared-network-cmp", description : "Shared network compartment", defined_tags : {}, freeform_tags : {}, 
                                children : {}
                            },
                            SECURITY-CMP : { name : "shared-security-cmp", description : "Shared security compartment", defined_tags : {}, freeform_tags : {},
                                children : {}
                            },
                            APP-CMP : { name : "application-cmp", description : "Application compartment", defined_tags : {}, freeform_tags : {},
                                children : {
                                    APP-DEV-CMP : { name : "application-dev-cmp", description : "Application Development compartment", defined_tags : {}, freeform_tags : {},
                                        children : {}
                                    },
                                    APP-PRD-CMP : { name : "application-prd-cmp", description : "Application Production compartment", defined_tags : {}, freeform_tags : {},
                                        children : {}
                                    }
                                }
                            },
                            DB-CMP : { name : "database-cmp", description : "Database compartment", defined_tags : {}, freeform_tags : {},
                                children : {
                                    DB-DEV-CMP : { name : "database-dev-cmp", description : "Database Development compartment", defined_tags : {}, freeform_tags : {},
                                        children : {}
                                    },
                                    DB-PRD-CMP : { name : "database-prd-cmp", description : "Database Production compartment",  defined_tags : {}, freeform_tags : {},
                                        children : {}
                                    }
                                }
                            },
                            EXACS-CMP : { name : "exacs-cmp", description : "Exadata CS compartment",  defined_tags : {}, freeform_tags : {},
                                children : {}
                            } 
                        }
                    }
}