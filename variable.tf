variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}


variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "s3_bucket_name" {
  description = "The s3 bucket name"
  default     = ""
}


variable "dynamodb_table_name" {
  description = "The dynamodb_table_name name"
  default     = ""
}

variable "encrypt_state" {
  description = "The encrypt_state name"
  default     = ""
}

variable "state_file_key" {
  description = "The state_file_key name"
  default     = ""
}