resource "aws_vpc" "tf_project_vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.environment}-vpc"
}
}

# Internet Gateway
resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_project_vpc.id

  tags = {
    Name = "${var.environment}-tf_igw"
  }
}

# Public subnet for IGW
resource "aws_subnet" "public" {
  for_each = var.public_subnets
  vpc_id = aws_vpc.tf_project_vpc.id
  availability_zone = each.key
  cidr_block = each.value
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.environment}-public-${each.key}"
    Tier = "public"
  })
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
  for_each = aws_subnet.public
  subnet_id = each.value.id
  route_table_id = aws_route_table.public_rt.id
  
}


# Private subnet for internal resources EC2, ASG, RDS
resource "aws_subnet" "private" {
  for_each = var.private_subnets
  vpc_id = aws_vpc.tf_project_vpc.id
  availability_zone = each.key
  cidr_block = each.value
  map_public_ip_on_launch = false

  
tags = merge(var.tags, {
    Name = "${var.environment}-private-${each.key}"
    Tier = "private"
  })

}


# Private route table
resource "aws_route_table" "private_rt" {
  for_each = var.private_subnets
  vpc_id = aws_vpc.tf_project_vpc.id

  tags     = merge(var.tags, { 
    Name = "${var.environment}-private-rt-${each.key}" 
    })
}

resource "aws_route_table_association" "pvt_association" {
  for_each       = var.private_subnets
  subnet_id = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private_rt[each.key].id
  
}

######################################
# NAT Gateway
######################################

# Ealstic IP

resource "aws_eip" "eip" {
  for_each = var.public_subnets
  domain = "vpc"

  tags = {
    Name = "${var.environment}-nat-eip-${each.key}"
  }

  depends_on = [aws_internet_gateway.tf_igw]
}


# NAT Gateway
resource "aws_nat_gateway" "tf_nat" {
  for_each = var.public_subnets
  allocation_id = aws_eip.eip[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.tf_igw]
}


resource "aws_route" "private_default" {
  for_each = var.private_subnets
  route_table_id = aws_route_table.private_rt[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.tf_nat[each.key].id
}