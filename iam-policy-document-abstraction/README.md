<!-- BEGIN_TF_DOCS -->

# This is used to return a single document with the appropriate MFA choice
---

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_principal_arns"></a> [principal\_arns](#input\_principal\_arns) | ARNs of accounts, users, or roles who can assume this role | `list(string)` | n/a | yes |
| <a name="input_require_mfa"></a> [require\_mfa](#input\_require\_mfa) | ARNs of accounts, users, or roles who can assume this role | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_policy_json"></a> [iam\_policy\_json](#output\_iam\_policy\_json) | Permissions attached to the policy |

---
<!-- END_TF_DOCS -->