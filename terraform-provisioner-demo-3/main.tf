provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "aws-key" {
  key_name = "my-testserver-1-key-private"
  public_key = file("/root/.ssh/id_rsa.pub")
}

resource "aws_vpc" "vpc-creation" {
  cidr_block = var.cidr
}

resource "aws_subnet" "subnet-creation" {
  vpc_id = aws_vpc.vpc-creation.id
  cidr_block = var.cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
}

resource "aws_internet_gateway" "internet-gateway-creation" {
  vpc_id = aws_vpc.vpc-creation.id
}

resource "aws_route_table" "route-table-creation" {
  vpc_id = aws_vpc.vpc-creation.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-creation.id
  }
}

resource "aws_route_table_association" "RT-association-creation" {
  subnet_id = aws_subnet.subnet-creation.id
  route_table_id = aws_route_table.route-table-creation.id
}

resource "aws_security_group" "web-sg-creation" {
  name = "web-sg"
  description = "Allow inbound and outbound traffic for web server"
  vpc_id = aws_vpc.vpc-creation.id

  ingress {
    description = "Allow HTTP traffic"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH traffic"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "ec2-creation" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = aws_subnet.subnet-creation.id
  key_name = aws_key_pair.aws-key.key_name
  vpc_security_group_ids = [aws_security_group.web-sg-creation.id]

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("/root/.ssh/id_rsa")
    host = self.public_ip
  }

  tags = {
    Name = "web-server-instance"
  }

  provisioner "file" {
    source = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  provisioner "remote-exec" {
  inline = [
    "echo 'Hello this is ec3 instance' "
    "sudo apt update -y",
    "sudo apt install python3-pip -y",
    "cd /home/ubuntu",
    "sudo pip3 install flask",
    "sudo python3 app.py",
  ]
}
}
