resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

resource "aws_instance" "nat" {
  count = var.enable_nat ? 1 : 0

  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.nat_instance_type
  subnet_id                   = values(aws_subnet.public)[0].id
  vpc_security_group_ids      = [aws_security_group.nat.id]
  associate_public_ip_address = true
  source_dest_check           = false # Required for NAT functionality

  user_data = <<-EOF
              #!/bin/bash
              echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.conf
              sudo sysctl -p
              sudo iptables -t nat -A POSTROUTING -o ens5 -s ${var.main_vpc_cidr} -j MASQUERADE
              EOF

  tags = {
    Name = "nat-gw-instance"
    Role = "nat-gw"
  }
}

# Update private route table to use NAT instance
resource "aws_route" "private_nat_route" {
  count = var.enable_nat ? 1 : 0

  route_table_id         = aws_route_table.private[0].id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = aws_instance.nat[0].primary_network_interface_id
}