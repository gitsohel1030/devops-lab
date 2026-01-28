
variable "ec2_type" {
  description = "instance type"
  type        = string
  # default = "t3.micro"
}

variable "sec_grp_id_out" {
  description = "VPC ID where SG will be created"
  type        = string
}

variable "subnet_id_out" {
  description = "VPC ID where SG will be created"
  type        = string
}

variable "environment" {
  type        = string
  description = "Environment name"
}