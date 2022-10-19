<!-- BEGIN_TF_DOCS -->
# terraform-aws-iam-role-cross-account-trusting

GitHub: [StratusGrid/terraform-aws-iam-role-cross-account-trusting](https://github.com/StratusGrid/terraform-aws-iam-role-cross-account-trusting)

This module creates a role that can be assumed by another principal (usually in another account, but could be user or role) to act as that role with permissions from the attached policies.

### <span style="color:red">NOTE:</span> This is the TRUSTING side. You will still need to create a policy on the TRUSTED side that allows users in that account to assume the role

## Example usage of the module:
```hcl
module "iam_role_cross_account_trusting_admin" {
  source         = "StratusGrid/iam-role-cross-account-trusting/aws"
  version        = "2.0.0"
  role_name      = "cross-account-role-admin"
  principal_arns = ["arn:aws:iam::ACCOUNT_ID:root"]
  policy_arns    = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  input_tags     = merge(local.common_tags, {})
  require_mfa    = false
}
```
---

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.cross_account_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cross_account_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_input_tags"></a> [input\_tags](#input\_input\_tags) | Map of tags to apply to resources | `map(string)` | `{}` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Max session duration for iam role | `string` | `3600` | no |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | ARNs for policies attached to this role | `list(string)` | n/a | yes |
| <a name="input_principal_arns"></a> [principal\_arns](#input\_principal\_arns) | ARNs of accounts, users, or roles who can assume this role | `list(string)` | n/a | yes |
| <a name="input_require_mfa"></a> [require\_mfa](#input\_require\_mfa) | Boolean to determine whether the role should require users assuming it to have MFA enabled | `bool` | `false` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name for the role being created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN of newly created role |
| <a name="output_role_assumption_url"></a> [role\_assumption\_url](#output\_role\_assumption\_url) | URL Shortcut to assume role in Console |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | Name of newly created role |

---

<span style="color:red">Note:</span> Manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml .`
<!-- END_TF_DOCS -->