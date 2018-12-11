data "aws_iam_policy_document" "cross_account_assume_role_policy_mfa" {
  count = "${var.require_mfa}"

  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["${var.principal_arns}"]
    }

    actions = ["sts:AssumeRole"]

    condition {
      test = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values = [
        "true"
      ]
    }
  }
}

resource "aws_iam_role" "cross_account_assume_role_mfa" {
  count = "${var.require_mfa}"
  name               = "${var.role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.cross_account_assume_role_policy.json}"
}

data "aws_iam_policy_document" "cross_account_assume_role_policy" {
  count = "${1 - var.require_mfa}"
  
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["${var.principal_arns}"]
    }

    actions = ["sts:AssumeRole"]

    condition {
      test = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values = [
        "true"
      ]
    }
  }
}

resource "aws_iam_role" "cross_account_assume_role" {
  count = "${1 - var.require_mfa}"
  name               = "${var.role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.cross_account_assume_role_policy.json}"
}

resource "aws_iam_role_policy_attachment" "cross_account_assume_role" {
  count = "${length(var.policy_arns)}"
  role       = "${aws_iam_role.cross_account_assume_role.name}"
  policy_arn = "${element(var.policy_arns, count.index)}"
}
