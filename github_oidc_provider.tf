resource "aws_iam_openid_connect_provider" "gh_oidc_provider" {
  url = "https://${var.github_actions_token_host}"
  client_id_list = [
    "sts.amazonaws.com"
  ]
}
