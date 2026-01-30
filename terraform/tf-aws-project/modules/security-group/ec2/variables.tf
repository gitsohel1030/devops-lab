
variable "vpc_id_out" {
  description = "VPC ID where SG will be created"
  type        = string
}

variable "alb_sg_id" {
    description = "alb sg id"
    type = string
}

variable "ec2_port" {
    description = "port"
    type = number
    default = 80
  
}

variable "egress_ipv4" {
    description = "port"
    type = string
  
}