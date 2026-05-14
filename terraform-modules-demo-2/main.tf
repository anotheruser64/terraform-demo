provider "aws" {
  region = "us-east-1"
}

module "ec2-creation" {
  source = "./modules/ec2_instance"
}

module "s3-creation" {
  source = "./modules/aws_s3"
}