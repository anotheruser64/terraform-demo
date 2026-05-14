provider "aws" {
  region = "us-east-1"
}



resource "aws_s3_bucket" "aws_s3_creation" {
  bucket = "aws-anotheruser-my-terraform-state-bucket"
}