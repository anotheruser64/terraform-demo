provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-091138d0f0d41ff90"
  instance_type = "t2.micro"
  subnet_id = "subnet-09792fe328eb83f36"
}