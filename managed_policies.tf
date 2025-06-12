data "aws_iam_policy" "gha_managed_policies" {
  for_each = var.github_actions_required_managed_policies
  arn      = each.value
}
