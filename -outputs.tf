output "role_arn" {
  description = "ARN of newly created role"
  value = "${aws_iam_role.cross_account_assume_role.arn}"
}
