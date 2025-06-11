terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "rs-school.andrey.tfstate"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "rs-school.andrey.tflock"
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "rs-school"
}

data "aws_caller_identity" "current" {}

# Required AWS Managed Policies
data "aws_iam_policy" "ec2_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

data "aws_iam_policy" "route53_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

data "aws_iam_policy" "s3_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

data "aws_iam_policy" "iam_full_access" {
  arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

data "aws_iam_policy" "vpc_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

data "aws_iam_policy" "sqs_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

data "aws_iam_policy" "event_bridge_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}

# IAM Role for GitHub Actions
resource "aws_iam_role" "github_actions_role" {
  name = "GithubActionsRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Attach the required policies to the GitHub Actions role
resource "aws_iam_role_policy_attachment" "gha_ec2_full_access" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = data.aws_iam_policy.ec2_full_access.arn
}

resource "aws_iam_role_policy_attachment" "gha_route53_full_access" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = data.aws_iam_policy.route53_full_access.arn
}

resource "aws_iam_role_policy_attachment" "gha_s3_full_access" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = data.aws_iam_policy.s3_full_access.arn
}

resource "aws_iam_role_policy_attachment" "gha_iam_full_access" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = data.aws_iam_policy.iam_full_access.arn
}

resource "aws_iam_role_policy_attachment" "gha_vpc_full_access" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = data.aws_iam_policy.vpc_full_access.arn
}

resource "aws_iam_role_policy_attachment" "gha_sqs_full_access" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = data.aws_iam_policy.sqs_full_access.arn
}

resource "aws_iam_role_policy_attachment" "gha_event_bridge_full_access" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = data.aws_iam_policy.event_bridge_full_access.arn
}

