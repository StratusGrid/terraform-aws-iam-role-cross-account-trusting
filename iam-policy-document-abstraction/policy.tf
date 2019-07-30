data "aws_iam_policy_document" "cross_account_assume_role_policy_mfa" {
  count = var.require_mfa

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
  count = 1 - var.require_mfa

  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.principal_arns
    }

    actions = ["sts:AssumeRole"]
  }
}

