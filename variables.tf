variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy resources in"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "List of availability zones in the AWS region"
}

variable "github_actions_role_name" {
  type        = string
  description = "Name of the IAM role for GitHub Actions"
}

variable "github_org" {
  type        = string
  description = "GitHub organization name"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name"
}

variable "github_actions_token_host" {
  type        = string
  default     = "token.actions.githubusercontent.com"
  description = "GitHub URL for OIDC token actions"
}

variable "github_actions_required_managed_policies" {
  type        = map(string)
  description = "List of required AWS managed policies for GitHub Actions"
}

variable "main_vpc_cidr" {
  type        = string
  description = "CIDR block for the main VPC"
}

variable "main_public1_subnet_cidr" {
  type        = string
  description = "CIDR block for the Public Subnet 1 of main VPC"
}

variable "main_private1_subnet_cidr" {
  type        = string
  description = "CIDR block for the Private Subnet 1 of main VPC"
}


variable "main_public2_subnet_cidr" {
  type        = string
  description = "CIDR block for the Public Subnet 2 of main VPC"
}

variable "main_private2_subnet_cidr" {
  type        = string
  description = "CIDR block for the Private Subnet 2 of main VPC"
}

variable "bastion_ip" {
  type = string
  description = "Private IP address for the Bastion host"
}

variable "private1_instance_ip" {
  type = string
  description = "Private IP address for the Private Subnet 1 instance"
}

variable "public2_instance_ip" {
  type        = string
  description = "Private IP address for the Public Subnet 2 instance"
}

variable "private2_instance_ip" {
  type = string
  description = "Private IP address for the Private Subnet 2 instance"
}

variable "amis" {
  description = "Which AMI to spawn."
  default = {
    us-east-1 = "ami-09e6f87a47903347c"
  }
}
variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_instance_name" {
  description = "Name of the EC2 instance"
  default     = "terraform-lab"
}

variable "ssh_pubkey_file" {
  description = "Path to an SSH public key"
  default     = "~/.ssh/aws/aws_key.pub"
}
