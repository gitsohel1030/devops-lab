resource "aws_vpc" "tf-project-vpc" {
  cidr_block = var.vpc-cidr
}