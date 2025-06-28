resource "aws_vpc" "main" {
  cidr_block           = var.main_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.main_public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.main_public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index % length(var.availability_zones)]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count                   = length(var.main_private_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.main_private_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index % length(var.availability_zones)]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

resource "aws_network_acl" "nacl_allow_all" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "-1"
    action     = "Allow"
    rule_no    = 100
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    action     = "Allow"
    rule_no    = 100
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "nacl-allow-all"
  }
}
