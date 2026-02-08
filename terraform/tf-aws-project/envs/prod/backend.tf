terraform {
  backend "s3" {
    bucket         = "tf-project-dev-state"
    key            = "prod/terraform.tfstate"
    dynamodb_table = "tf_state_locks"
    region         = "ap-south-1"
    encrypt        = true
  }
}