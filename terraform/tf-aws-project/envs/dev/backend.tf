terraform {
  backend "s3" {
    bucket  = "tf-project-dev-state"
    key     = "dev/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}