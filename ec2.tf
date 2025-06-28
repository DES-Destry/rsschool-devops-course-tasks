data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"] # Amazon Linux 2023
  }
}

resource "aws_eip" "bastion_ip" {
  instance = aws_instance.bastion.id
  domain   = "vpc"

  tags = {
    Name = "bastion-eip"
  }
}

resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = file("./bastion-key.pub")
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public[0].id
  key_name      = aws_key_pair.bastion.key_name

  vpc_security_group_ids = [aws_security_group.bastion.id]

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "private_1" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private[0].id

  tags = {
    Name = "private-1"
  }
}

resource "aws_instance" "private_2" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private[1].id

  tags = {
    Name = "private-1"
  }
}
