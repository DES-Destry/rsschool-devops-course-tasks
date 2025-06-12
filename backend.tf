terraform {
  backend "s3" {
    bucket         = "rs-school.andrey.tf"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "rs-school.andrey.tf_state_lock"
    profile        = "rs-school"
  }
}
