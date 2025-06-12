aws_region               = "us-east-1"
aws_profile              = "rs-school"
github_actions_role_name = "GithubActionsRole"
github_org               = "DES-Destry"
github_repo              = "rsschool-devops-course-tasks"

github_actions_required_managed_policies = {
  ec2_full_access          = "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
  route_53_full_access     = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
  s3_full_access           = "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  dynamo_db_full_access    = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
  iam_full_access          = "arn:aws:iam::aws:policy/IAMFullAccess",
  vpc_full_access          = "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
  sqs_full_access          = "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
  event_bridge_full_access = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}
