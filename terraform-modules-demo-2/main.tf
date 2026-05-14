provider "aws" {
  region = "us-east-1"
}

module "ec2-creation" {
  source = "./modules/ec2_instance"
  ami-instance = var.ami-instance
  instance-type-aws = var.instance-type-aws
  subnet-aws = var.subnet-aws
}

module "s3-creation" {
  source = "./modules/aws_s3"
  bucket_name = var.bucket_name
}