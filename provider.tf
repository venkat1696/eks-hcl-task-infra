provider "aws" {
  region = "us-west-2" # Replace with your desired region
}

terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket = var.s3_bucket_name
    key    = var.state_file_key
    region = var.aws_region
  }
}
