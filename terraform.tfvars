aws_region                = "us-east-1"
availability_zones        = ["us-east-1a", "us-east-1b"]
github_actions_role_name  = "GithubActionsRole"
github_org                = "DES-Destry"
github_repo               = "rsschool-devops-course-tasks"
github_actions_token_host = "token.actions.githubusercontent.com"

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

main_vpc_cidr             = "10.0.0.0/16"
main_public1_subnet_cidr  = "10.0.1.0/24"
main_private1_subnet_cidr = "10.0.2.0/24"
main_public2_subnet_cidr  = "10.0.3.0/24"
main_private2_subnet_cidr = "10.0.4.0/24"

bastion_ip = "10.0.1.1"
private1_instance_ip = "10.0.2.1"
public2_instance_ip = "10.0.3.1"
private2_instance_ip = "10.0.4.1"
