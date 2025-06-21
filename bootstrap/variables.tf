variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy resources in"
}

variable "s3_state_bucket_name" {
  type        = string
  description = "Name of the S3 bucket used for Terraform state"
}

variable "lock_table_name" {
  type        = string
  description = "Name of the DynamoDB table used for state locking"
}
