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
  type        = string
}


# SG Variables
variable "ssh_cidr" {
  description = "declaring variable for ssh cidr value"
  type        = string
}

variable "http_ipv4_cidr" {
  description = "declaring variable"
  type        = string
}

variable "egress_ipv4_cidr" {
  description = "declaring variable"
  type        = string
}


# EC2 Variables
variable "ec2_type" {
  description = "declaring variabl"
  type        = string
}