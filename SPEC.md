## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_identity_compartment.level_2](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_identity_compartment.level_3](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_identity_compartment.level_4](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_identity_compartment.level_5](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_identity_compartment.level_6](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_identity_compartment.these](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartments"></a> [compartments](#input\_compartments) | The compartments topology, given as a map of objects nested up to six levels. | <pre>map(object({<br>    name          = string<br>    description   = string<br>    parent_id     = string<br>    defined_tags  = map(string)<br>    freeform_tags = map(string)<br>    children    = map(object({<br>      name          = string<br>      description   = string<br>      defined_tags  = map(string)<br>      freeform_tags = map(string)<br>      children      = map(object({<br>        name          = string<br>        description   = string<br>        defined_tags  = map(string)<br>        freeform_tags = map(string)<br>        children      = map(object({<br>          name          = string<br>          description   = string<br>          defined_tags  = map(string)<br>          freeform_tags = map(string)<br>          children      = map(object({<br>            name          = string<br>            description   = string<br>            defined_tags  = map(string)<br>            freeform_tags = map(string)<br>            children      = map(object({<br>              name          = string<br>              description   = string<br>              defined_tags  = map(string)<br>              freeform_tags = map(string)<br>            }))  <br>          }))<br>        }))<br>      }))<br>    }))  <br>  }))</pre> | `{}` | no |
| <a name="input_enable_compartments_delete"></a> [enable\_compartments\_delete](#input\_enable\_compartments\_delete) | Whether compartments are physically deleted upon destroy. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_level_1_compartments"></a> [level\_1\_compartments](#output\_level\_1\_compartments) | The level 1 compartments. |
| <a name="output_level_2_compartments"></a> [level\_2\_compartments](#output\_level\_2\_compartments) | The level 2 compartments, children of level 1 compartments. |
| <a name="output_level_3_compartments"></a> [level\_3\_compartments](#output\_level\_3\_compartments) | The level 3 compartments, children of level 2 compartments. |
| <a name="output_level_4_compartments"></a> [level\_4\_compartments](#output\_level\_4\_compartments) | The level 4 compartments, children of level 3 compartments. |
| <a name="output_level_5_compartments"></a> [level\_5\_compartments](#output\_level\_5\_compartments) | The level 5 compartments, children of level 4 compartments. |
| <a name="output_level_6_compartments"></a> [level\_6\_compartments](#output\_level\_6\_compartments) | The level 6 compartments, children of level 5 compartments. |
