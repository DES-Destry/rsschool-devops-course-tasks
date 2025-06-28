resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    gateway_id = aws_internet_gateway.main.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "main-public-route-table"
  }
}

resource "aws_route_table_association" "public_associations" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  count = var.enable_nat ? 1 : 0

  vpc_id = aws_vpc.main.id

  route {
    network_interface_id = aws_instance.nat[0].primary_network_interface_id
    cidr_block           = "0.0.0.0/0"
  }

  tags = {
    Name = "main-private-route-table"
  }
}

resource "aws_route_table_association" "private_associations" {
  count          = var.enable_nat ? length(aws_subnet.private) : 0
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}

