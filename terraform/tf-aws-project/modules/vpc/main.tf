resource "aws_vpc" "tf-project-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.environment}-vpc"
}
}

resource "aws_subnet" "tf_project_subnet_public" {
  vpc_id     = aws_vpc.tf-project-vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.subnet_AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-subnet"

  }
}