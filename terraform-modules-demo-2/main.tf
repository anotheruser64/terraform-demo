provider "aws" {
  region = "us-east-1"
}

module "ec2_creation" {
  source = "./modules/ec2_instance"
}