provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami = var.ami_id
  instance_type = var.instance
  subnet_id = var.subnet
}

