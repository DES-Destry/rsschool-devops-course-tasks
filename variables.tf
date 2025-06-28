variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy resources in"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones in the AWS region"
}

variable "main_vpc_cidr" {
  type        = string
  description = "CIDR block for the main VPC"
}

variable "main_public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the Public Subnets of main VPC"
}

variable "main_private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the Private Subnets of main VPC"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instances"
  default     = "t2.micro" # Free tier eligible
}

variable "enable_nat" {
  type        = bool
  description = "If true, deploy a NAT instance in the public subnet"
}

variable "nat_instance_type" {
  type        = string
  description = "Instance type for the NAT instance"
  default     = "t2.micro" # Free tier eligible
}
