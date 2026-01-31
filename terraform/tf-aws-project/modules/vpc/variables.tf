
variable "vpc_cidr" {
  description = "vpc cidr value"
  type        = string
}

variable "environment"{
  description = "Environment name"
  type        = string
}


variable "public_subnets" {
  description = "Map of AZ -> CIDR for public subnets"
  type = map(string)
  
  # e.g. {
  #   "ap-south-1a" = "10.0.0.0/24"
  #   "ap-south-1b" = "10.0.1.0/24"
  # }

}


variable "private_subnets" {
  description = "Map of AZ -> CIDR for private subnets"
  type        = map(string)

  
  # e.g. {
  #   "ap-south-1a" = "10.0.10.0/24"
  #   "ap-south-1b" = "10.0.11.0/24"
  # }

}


variable "tags" {
  type    = map(string)
  default = {}
}
