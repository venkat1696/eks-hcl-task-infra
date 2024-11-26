resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Terraform State"
    Environment = "Production"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = var.terraform-lock-table
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform State Lock"
    Environment = "Production"
  }
}

terraform {
  backend "s3" {
    bucket         = "your-unique-terraform-state-bucket"  # Replace with your S3 bucket name
    key            = "terraform/state/terraform.tfstate"  # The path within the bucket for the state file
    region         = "us-west-2"                          # Replace with your AWS region
    encrypt        = true                                 # Enable server-side encryption for the state file
    dynamodb_table = "terraform-state-locks"              # The DynamoDB table for state locking
    acl            = "private"                            # The access control list for the S3 bucket
  }
}
