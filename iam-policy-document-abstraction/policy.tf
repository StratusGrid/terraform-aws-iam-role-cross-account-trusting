data "aws_iam_policy_document" "cross_account_assume_role_policy_mfa" {
  count = var.require_mfa ? 1 : 0

  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.principal_arns
    }

    actions = ["sts:AssumeRole"]

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values = [
        "true",
      ]
    }
  }
}

data "aws_iam_policy_document" "cross_account_assume_role_policy" {
  count = var.require_mfa ? 0 : 1

  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.principal_arns
    }

    actions = ["sts:AssumeRole"]
  }
}

