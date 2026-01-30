variable "alb_sg_id" {
    type = string
    description = "alb sg id"
  
}

variable "environment" {
    type = string
    description = "environment dev/prod"
  
}

variable "subnet_id_out" {
    description = "subnet id"
    type = string
}

variable "target_port" {
    type = number
    description = "tg port"
  
}

variable "vpc_id_out" {
    type = string
    description = "voc id"
  
}

variable "listener_port" {
    type = number
    description = "tg port"
  
}