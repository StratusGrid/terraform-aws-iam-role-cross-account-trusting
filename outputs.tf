output "role_arn" {
  description = "ARN of newly created role"
  value       = aws_iam_role.cross_account_assume_role.arn
}

output "role_name" {
  description = "Name of newly created role"
  value       = aws_iam_role.cross_account_assume_role.name
}

output "role_assumption_url" {
  description = "URL Shortcut to assume role in Console"
  value       = "https://signin.aws.amazon.com/switchrole?account=${data.aws_caller_identity.current.account_id}&roleName=${aws_iam_role.cross_account_assume_role.name}&displayName="
}

