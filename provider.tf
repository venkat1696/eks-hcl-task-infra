provider "aws" {
  region = "us-west-2" # Replace with your desired region
}

terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "eks/terraform.tfstate"
    region = "us-west-2"
  }
}
