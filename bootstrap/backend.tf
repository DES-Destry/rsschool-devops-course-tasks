terraform {
  backend "s3" {
    bucket = "rs-school.andrey.tf"
    key    = "bootstrap/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    profile = "rs-school"
  }
}
