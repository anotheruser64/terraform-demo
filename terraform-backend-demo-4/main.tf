provider "aws" {
  region = "us-east-1"
}



resource "aws_s3_bucket" "aws_s3_creation" {
  bucket = "aws-anotheruser-my-terraform-state-bucket"
}

resource "aws_s3_bucket" "aws_s3_creation_2" {
  bucket = "aws-anotheruser-my-terraform-state-bucket-2026"
}