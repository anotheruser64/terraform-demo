provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami = var.ami-instance
  instance_type = var.instance-type-aws
  subnet_id = var.subnet-aws
}