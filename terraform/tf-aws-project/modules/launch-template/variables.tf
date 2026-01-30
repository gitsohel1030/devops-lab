# ami id
variable "ami_id" {
  description = "ami id"
  type = string
}

# instance type
variable "instance_type" {
  description = "instance type"
  type = string
}

# security group id 
variable "ec2_sg_id" {
  description = "security group id"
  type = string
}

variable "user_data" {
  description = "user data"
  type = string
  default = ""
}

variable "name" {
    description = "Base name for launch template"
    type = string
    default = "tf_lt"
  
}