resource "aws_vpc" "tf_project_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.environment}-vpc"
}
}

# Public subnet for IGW
resource "aws_subnet" "tf_project_subnet_public" {
  vpc_id     = aws_vpc.tf_project_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.subnet_AZ[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-subnet"

  }
}

# Private subnet for internal resources EC2, ASG, RDS
resource "aws_subnet" "tf_pvt_subnet" {
  vpc_id = aws_vpc.tf_project_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.subnet_AZ[1]
  map_public_ip_on_launch = false

  tags = {
    "name" = "pvt-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_project_vpc.id

  tags = {
    Name = "tf_igw"
  }
}

# public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.tf_project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id = aws_subnet.tf_project_subnet_public.id
  route_table_id = aws_route_table.public_rt.id
  
}


# Private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.tf_project_vpc.id

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "pvt_association" {
  subnet_id = aws_subnet.tf_pvt_subnet.id
  route_table_id = aws_route_table.private_rt.id
  
}