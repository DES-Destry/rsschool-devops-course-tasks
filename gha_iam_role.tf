# IAM Role for GitHub Actions
resource "aws_iam_role" "github_actions_role" {
  name = var.github_actions_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRoleWithWebIdentity"
      Principal = {
        Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
      }
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
        }
        StringLike = {
          "token.actions.githubusercontent.com:sub" = [
            "repo:${var.github_org}/${var.github_repo}:ref:refs/heads/main",
            "repo:${var.github_org}/${var.github_repo}:ref:refs/heads/task_1"
          ]
        }
      }
    }]
  })
}

# Attach the required policies to the GitHub Actions role
resource "aws_iam_role_policy_attachment" "gha_role_managed_policies" {
  role = aws_iam_role.github_actions_role.name

  for_each   = data.aws_iam_policy.gha_managed_policies
  policy_arn = each.value.arn
}
