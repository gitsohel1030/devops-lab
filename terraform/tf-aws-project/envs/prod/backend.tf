terraform {
  backend "s3" {
    bucket  = "tf-project-dev-state"
    key     = "prod/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}