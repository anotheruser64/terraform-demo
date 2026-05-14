terraform {
  backend "s3" {
    bucket = "aws-anotheruser-my-terraform-state-bucket"
    key = "terraform.tfstate"
    encrypt = true
    region = "us-east-1"
    }
}