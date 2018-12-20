output "iam_policy_json" {
  value = "${join(",", concat(data.aws_iam_policy_document.assume_role_policy.*.json, data.aws_iam_policy_document.assume_role_policy_mfa.*.json))}"
}
