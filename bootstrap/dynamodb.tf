# DynamoDB Table for Locking
resource "aws_dynamodb_table" "state_lock_table" {
  name         = var.lock_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    CreatedWith = "Terraform"
  }
}
