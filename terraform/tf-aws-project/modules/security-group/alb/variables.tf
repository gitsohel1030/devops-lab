
variable "vpc_id_out" {
  description = "VPC ID where SG will be created"
  type        = string
}

variable "alb_ingress_ipv4cidr" {
    description = "alb ingress https ipv4 cidr"
    type = string
  
}

variable "alb_egress_ipv4cidr" {
    description = "alb egress ipv4 cidr"
    type = string
  
}

variable "alb_ingress_ipv4cidr_http" {
    description = "alb ingress http ipv4 cidr"
  
}