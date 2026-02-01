# Environment
environment = "Production"

# provider variable value
aws_region = "ap-south-1"

# VPC Variables Values
vpc_cidr = "10.0.0.0/16"
public_subnets = {
  "ap-south-1a" = "10.0.0.0/24" #AZ as well as CIDR
  "ap-south-1b" = "10.0.1.0/24"
}

private_subnets = {
  "ap-south-1a" = "10.0.10.0/24" #AZ as well as CIDR
  "ap-south-1b" = "10.0.11.0/24"
}

# ALB SG
alb_ingress_ipv4cidr      = "0.0.0.0/0"
alb_egress_ipv4cidr       = "0.0.0.0/0"
alb_ingress_ipv4cidr_http = "0.0.0.0/0"


# EC2 - SG

ec2_port    = 80
egress_ipv4 = "0.0.0.0/0"


# ALB Variables

listener_port = 80
target_port   = 80

# Launch template 
instance_type = "t3.micro"
user_data     = ""

# ASG variables
name             = "tf_asg"
desired_capacity = 2
min_size         = 2
max_size         = 3
