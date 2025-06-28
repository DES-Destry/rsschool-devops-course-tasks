output "gha_role_arn" {
  value       = aws_iam_role.github_actions_role.arn
  description = "ARN of the IAM role created for GitHub Actions"
}