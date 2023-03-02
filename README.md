# CIS OCI Landing Zone IAM Compartments Module

![Landing Zone logo](./images/landing_zone_300.png)

This module manages arbitrary IAM (Identity & Access Management) compartment topologies in OCI (Oracle Cloud Infrastructure) based on a single map of objects that can be nested up to six levels. Appropriate compartments usage is a key consideration for OCI tenancy design and it is a recommendation of CIS (Center for Internet Security) OCI Foundations Benchmark. 

Check [module specification](./SPEC.md) for a full description of module requirements, supported variables, managed resources and outputs.

A fundamental principle in using a single map of objects is the ability to quickly visualize the actual compartment structure by simply looking at the variable definition. Within the map, each compartment is an object that has a *children* attribute that defines its sub-compartments. The map supports up to six levels of nesting, which is the maximum supported by OCI. The top-most compartment objects have a *parent_id* attribute used to identify the compartment's parent (in other words, where the particular tree descends from.)

Check the examples folder for various different compartment topologies. Specifically, [cis-landing-zone-quickstart](./examples/cis-landing-zone-quickstart/README.md) for the compartments deployed by [CIS OCI Landing Zone Quick Start](https://github.com/oracle-quickstart/oci-cis-landingzone-quickstart).

## Requirements
### IAM Permissions

This module requires the following OCI IAM permission in the aforementioned *parent_id* compartment:
```
Allow group <group> to manage compartments in compartment <parent_id>
```
If *parent_id* is the root compartment, the permission becomes:
```
Allow group <group> to manage compartments in tenancy
```
### Terraform Version < 1.3.0 and Optional Object Type Attributes
This module relies on [Terraform Optional Object Type Attributes feature](https://developer.hashicorp.com/terraform/language/expressions/type-constraints#optional-object-type-attributes), which is experimental from Terraform 0.14.x to 1.2.x. It shortens the amount of input values in complex object types, by having Terraform automatically inserting a default value for any missing optional attributes. The feature has been promoted and it is no longer experimental in Terraform 1.3.0.

**As is, this module can only be used with Terraform versions up to 1.2.x**, because it can be consumed by other modules via [OCI Resource Manager service](https://docs.oracle.com/en-us/iaas/Content/ResourceManager/home.htm), that still does not support Terraform 1.3.0.

Upon running *terraform plan* with Terraform versions prior to 1.3.0, Terraform displays the following warning:
```
Warning: Experimental feature "module_variable_optional_attrs" is active
```

Note the warning is harmless. The code has been tested with Terraform 1.3.0 and the implementation is fully compatible.

If you really want to use Terraform 1.3.0, remove the following line in [providers.tf](./providers.tf):
```
experiments = [module_variable_optional_attrs]
```

## Related Documentation
- [Account and Access Concepts](https://docs.oracle.com/en-us/iaas/Content/GSG/Concepts/concepts-account.htm#concepts-access)
- [Managing Compartments](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingcompartments.htm)
- [Compartments in Terraform OCI Provider](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment)

## Maintainers
- [Andre Correa](https://github.com/andrecorreaneto), [Josh Hammer](https://github.com/Halimer)

## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License
Copyright (c) 2022, Oracle and/or its affiliates.

Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

See [LICENSE](./LICENSE) for more details.

## Known Issues
None.
