provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "aws-s3-bucket" {
  bucket = "terraform-modules-demo-2-bucket"
}