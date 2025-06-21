resource "aws_route_table" "main_public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main_public_route_table"
  }
}

resource "aws_route" "main_public_route" {
  route_table_id         = aws_route_table.main_public_route_table.id
  gateway_id             = aws_internet_gateway.main_igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "main_public1_route_table_association" {
  subnet_id      = aws_subnet.main_public1_subnet.id
  route_table_id = aws_route_table.main_public_route_table.id
}

resource "aws_route_table_association" "main_public2_route_table_association" {
  subnet_id      = aws_subnet.main_public2_subnet.id
  route_table_id = aws_route_table.main_public_route_table.id
}

resource "aws_route_table" "main_private_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main_private_route_table"
  }
}

resource "aws_route_table_association" "main_private1_route_table_association" {
  subnet_id      = aws_subnet.main_private1_subnet.id
  route_table_id = aws_route_table.main_private_route_table.id
}

resource "aws_route_table_association" "main_private2_route_table_association" {
  subnet_id      = aws_subnet.main_private2_subnet.id
  route_table_id = aws_route_table.main_private_route_table.id
}
