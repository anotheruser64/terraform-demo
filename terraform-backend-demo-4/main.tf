provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  
}

resource "aws_s3_bucket" "aws_s3_creation" {
  bucket = "aws-anotheruser-my-terraform-state-bucket"
}