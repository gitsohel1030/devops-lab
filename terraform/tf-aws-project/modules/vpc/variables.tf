
variable "vpc_cidr" {
  description = "vpc cidr value"
  type        = string
}

variable "environment"{
  description = "Environment name"
  type        = string
}


variable "subnet_cidr" {
  description = "subnet cidr block"
  type = string
}


variable "subnet_AZ" {
  description = "subnet availability zone"
  type = string
}