variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "AWS region to deploy resources in"
}

variable "aws_profile" {
  type = string
  default = "rs-school"
  description = "AWS profile to use for authentication described in ~/.aws/credentials"
}

variable "s3_state_bucket_name" {
  type = string
  description = "Name of the S3 bucket used for Terraform state"
}

variable "lock_table_name" {
  type = string
  description = "Name of the DynamoDB table used for state locking"
}
