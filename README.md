# CIS OCI Landing Zone IAM Compartments Module

![Landing Zone logo](./images/landing_zone_300.png)

This module manages arbitrary IAM (Identity & Access Management) compartment topologies in OCI (Oracle Cloud Infrastructure) based on single map of objects that can be nested up to six levels. Appropriate compartments usage is a key consideration for OCI tenancy design and it is recommendation of CIS (Center for Internet Security) OCI Foundations Benchmark. 

Check [module specification](./SPEC.md) for a full description of module requirements, supported variables, managed resources and outputs.

A fundamental principle in using a single map of objects is the ability to quickly visualize the actual compartment structure by simply looking at the variable definition. Within the map, each compartment is an object that has a *children* attribute that defines its sub-compartments. The map supports up to six levels of nesting, which is the maximum supported by OCI. The top-most compartment objects have a *parent_id* attribute used to identify the compartment's parent (in other words, where that particular tree descends from.)

Check the examples folder for various different compartment topologies. Specifically, [cis-landing-zone-quickstart](./examples/cis-landing-zone-quickstart/README.md) for the compartments deployed by [CIS OCI Landing Zone Quickstart](https://github.com/oracle-quickstart/oci-cis-landingzone-quickstart).

## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License
Copyright (c) 2022, Oracle and/or its affiliates.

Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

See [LICENSE](./LICENSE) for more details.

## Known Issues
None.
