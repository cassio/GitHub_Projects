# Exemplo Deploy EC2 usando data + multiplos providers

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical Ubuntu
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

data "aws_ami" "ubuntu_west" {
  provider = aws.west-2
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical Ubuntu
}

resource "aws_instance" "web_west" {
  provider = aws.west-2
  ami           = data.aws_ami.ubuntu_west.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld West"
  }
}