variable "aws_region" {
  description = "aws region to deploy rsource"
  type        = string
}

variable "environment" {
  description = "Environment name (dev or prod)"
  type        = string
}

#VPC Variables 
variable "vpc_cidr" {
  description = "declaring variable, CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "declaring variable, subnet cidr block"
  type        = string
}

variable "subnet_AZ" {
  description = "Declaring variable for, subnet availability zone"
  type = tuple([string, string])
}


# Security group variable - ALB SG


variable "alb_ingress_ipv4cidr" {
  description = "alb ingress https ipv4 cidr"
  type        = string

}

variable "alb_egress_ipv4cidr" {
  description = "alb egress ipv4 cidr"
  type        = string

}

variable "alb_ingress_ipv4cidr_http" {
  description = "alb ingress http ipv4 cidr"

}


# EC2 - SG



variable "ec2_port" {
  description = "port"
  type        = number
  default     = 80

}

variable "egress_ipv4" {
  description = "port"
  type        = string

}



# ALB Variables

variable "listener_port" {
  type        = number
  description = "tg port"

}

variable "target_port" {
  type        = number
  description = "tg port"

}



# Launch Template
variable "instance_type" {
  description = "instance type"
  type        = string
}



variable "user_data" {
  description = "user data"
  type        = string
  default     = ""
}


# ASG variables

variable "name" {
  description = "base name for asg"
}

variable "desired_capacity" {
  description = "desired capacity of instances"
  type        = number
}


variable "min_size" {
  description = "minumum number of instances "
  type        = number
}

variable "max_size" {
  description = "maximum number of instances"
  type        = number
}



