output "role_arn" {
  description = "ARN of newly created role"
  value = "${aws_iam_role.cross_account_assume_role.arn}"
}

output "role_name" {
  description = "Name of newly created role"
  value = "${aws_iam_role.cross_account_assume_role.name}"
}
