aws_region         = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b"]

main_vpc_cidr             = "10.0.0.0/16"
main_public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
main_private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]

enable_nat    = false
instance_type = "t2.micro"