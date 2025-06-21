resource "aws_vpc" "main_vpc" {
  cidr_block           = var.main_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "main_public1_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.main_public1_subnet_cidr
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.main_igw]
  tags = {
    Name = "main_public1_subnet"
  }
}

resource "aws_subnet" "main_private1_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.main_private1_subnet_cidr
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "main_private1_subnet"
  }
}

resource "aws_subnet" "main_public2_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.main_public2_subnet_cidr
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.main_igw]
  tags = {
    Name = "main_public2_subnet"
  }
}

resource "aws_subnet" "main_private2_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.main_private2_subnet_cidr
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "main_private2_subnet"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "main_igw"
  }
}

resource "aws_network_acl" "main_nacl_allow_all" {
  vpc_id = aws_vpc.main_vpc.id

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
    Name = "main_nacl"
  }
}
