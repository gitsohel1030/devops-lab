# ----------------------------
# Network - VPC Module 
# ----------------------------
module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  subnet_AZ   = var.subnet_AZ
  environment = var.environment
}

# ----------------------------
# Security - SG Module 
# ----------------------------

module "security-group" {
  source = "../../modules/security-group/alb"

  vpc_id_out                = module.vpc.vpc_id_out
  alb_ingress_ipv4cidr_http = var.alb_ingress_ipv4cidr_http
  alb_egress_ipv4cidr       = var.alb_egress_ipv4cidr
  alb_ingress_ipv4cidr      = var.alb_ingress_ipv4cidr

}

module "security_group" {
  source = "../../modules/security-group/ec2"

  alb_sg_id   = module.security-group.alb_sg_id
  vpc_id_out  = module.vpc.vpc_id_out
  egress_ipv4 = var.egress_ipv4
  ec2_port    = var.ec2_port

}


# ----------------------------
# Load balancing - ELB Module 
# ----------------------------

module "alb" {
  source = "../../modules/alb"

  listener_port = var.listener_port
  subnet_id_out = module.vpc.subnet_id_out
  alb_sg_id     = module.security-group.alb_sg_id
  vpc_id_out    = module.vpc.vpc_id_out
  target_port   = var.target_port
  environment   = var.environment

}


# ----------------------------
# Fetching AMI  
# ----------------------------

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


# ----------------------------
# Launch Template - Compute Module 
# ----------------------------

module "launch_template" {
  source = "../../modules/launch-template"

  instance_type = var.instance_type
  ec2_sg_id     = module.security_group.ec2_sg_id
  ami_id        = data.aws_ami.ubuntu.id
  name = "tf_lt"
}


# ----------------------------
# Auto Scaling Group - ASG Module 
# ----------------------------

module "asg" {
  source = "../../modules/asg"

  lt_id             = module.launch_template.lt_id
  lt_version        = module.launch_template.lt_version
  desired_capacity  = var.desired_capacity
  min_size          = var.min_size
  max_size          = var.max_size
  target-group-arn  = module.alb.target-group-arn
  private_subnet_id = module.vpc.private_subnet_id
  name              = var.name
}