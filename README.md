# terraform-modules-template-public
This Terraform module creates an AWS IAM role with configurable trust policies, inline policies, and attached managed policies. It allows for flexible IAM role creation for various AWS services and applications.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.service_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.managed_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_append_environment_to_role_name"></a> [append\_environment\_to\_role\_name](#input\_append\_environment\_to\_role\_name) | Append environment name to role name | `bool` | `true` | no |
| <a name="input_assume_role_policy_document"></a> [assume\_role\_policy\_document](#input\_assume\_role\_policy\_document) | The policy document that grants permission to assume the role. | `string` | n/a | yes |
| <a name="input_env_short"></a> [env\_short](#input\_env\_short) | Short string for environment | `string` | n/a | yes |
| <a name="input_managed_policies"></a> [managed\_policies](#input\_managed\_policies) | List of managed policy ARNs to attach to the resource | `list(string)` | `[]` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | The maximum session duration for the role, in seconds. | `number` | `3600` | no |
| <a name="input_path"></a> [path](#input\_path) | The path for the role. | `string` | `"/service-role/"` | no |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | A description for the IAM policy. | `string` | n/a | yes |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | The statements to include in the IAM policy. | <pre>list(object({<br/>    Effect    = string<br/>    Action    = list(string)<br/>    Resource  = list(string)<br/>    Condition = optional(any)<br/>  }))</pre> | `[]` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | The name of the IAM role. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_outputs"></a> [outputs](#output\_outputs) | n/a |
<!-- END_TF_DOCS -->