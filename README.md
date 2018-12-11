# terraform-aws-iam-role-cross-account-trusting
Creates a role that can be assumed by another principal (usually another account, but could be user or role) to act as that role with permissions from the attached policies.

## Example Usage:
```
module "iam_role_cross_account_trusting_admin" {
  source = "StratusGrid/s3-bucket-kops-state/aws"
  version = "1.0.0"
  role_name = "cross-account-role-admin"
  principal_arns = ["arn:aws:iam::<ACCOUNT_ID>:root"]
  policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  input_tags = "${local.common_tags}"
  require_mfa = false
}

```
