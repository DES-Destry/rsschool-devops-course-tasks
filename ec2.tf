resource "aws_eip" "bastion_ip" {
  instance = aws_instance.bastion_instance.id
  associate_with_private_ip = var.bastion_ip

  depends_on = [aws_internet_gateway.main_igw]

  tags = {
    Name = "Bastion Instance EIP"
  }
}

resource "aws_eip" "public2_ip" {
  instance = aws_instance.public2_instance.id
  associate_with_private_ip = var.public2_instance_ip

  depends_on = [aws_internet_gateway.main_igw]

  tags = {
    Name = "Public 2 Instance EIP"
  }
}

resource "aws_instance" "bastion_instance" {
  ami                         = var.amis.us-east-1
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main_public1_subnet.id
  key_name                    = "bastion-instance-key"

  private_ip = var.bastion_ip

  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "Bastion"
  }
}

resource "aws_instance" "private1_instance" {
  ami                         = var.amis.us-east-1
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main_private1_subnet.id

  private_ip = var.private1_instance_ip

  tags = {
    Name = "Private 1 Instance"
  }
}

resource "aws_instance" "public2_instance" {
  ami                         = var.amis.us-east-1
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main_public2_subnet.id

  private_ip = var.public2_instance_ip

  tags = {
    Name = "Public 2 Instance"
  }
}

resource "aws_instance" "private2_instance" {
  ami                         = var.amis.us-east-1
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main_private2_subnet.id

  private_ip = var.private1_instance_ip

  tags = {
    Name = "Private 2 Instance"
  }
}
