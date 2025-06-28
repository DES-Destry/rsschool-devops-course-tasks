terraform {
  backend "s3" {
    bucket       = "rs-school.andrey.tf"
    key          = "state/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
