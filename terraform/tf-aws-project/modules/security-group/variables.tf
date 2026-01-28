
variable "vpc_id_out" {
  description = "VPC ID where SG will be created"
  type        = string
}

variable "ssh_cidr" {
  description = "ssh my ipv4 cidr value"
  type        = string
  # default     = "167.103.20.173/32"
}

variable "http_ipv4_cidr" {
  description = "http ingress ipv4 cidr value"
  type        = string
  # default     = "0.0.0.0/0"
}

variable "egress_ipv4_cidr" {
  description = "egress ipv4 cidr value"
  type        = string
  # default     = "0.0.0.0/0"
}

variable "environment" {
  type        = string
  description = "Environment name"
}