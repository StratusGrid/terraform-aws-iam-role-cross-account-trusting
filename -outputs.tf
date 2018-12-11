output "role_arn" {
  description = "ARN of newly created role"
  value = "${join(",", concat(aws_iam_role.cross_account_assume_role.*.arn, aws_iam_role.cross_account_assume_role.*.arn))}"
}
