data "aws_iam_policy_document" "github_role_policy" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${var.github_actions_token_host}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${var.github_actions_token_host}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "${var.github_actions_token_host}:sub"
      values   = ["repo:${var.github_org}/${var.github_repo}:*"]
    }
  }
}

# IAM Role for GitHub Actions
resource "aws_iam_role" "github_actions_role" {
  name               = var.github_actions_role_name
  assume_role_policy = data.aws_iam_policy_document.github_role_policy.json
}

# Attach the required policies to the GitHub Actions role
resource "aws_iam_role_policy_attachment" "gha_role_managed_policies" {
  role = aws_iam_role.github_actions_role.name

  for_each   = data.aws_iam_policy.gha_managed_policies
  policy_arn = each.value.arn
}
