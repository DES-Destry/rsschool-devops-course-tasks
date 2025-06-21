output "gha_role_arn" {
  value       = aws_iam_role.github_actions_role.arn
  description = "ARN of the IAM role created for GitHub Actions"
}

output "bastion_ip" {
  value = aws_eip.bastion_ip.public_ip
  description = "Public IP of the Bastion instance"
}

output "public2_ip" {
  value = aws_eip.public2_ip.public_ip
  description = "Public IP of the Public 2 instance"
}
