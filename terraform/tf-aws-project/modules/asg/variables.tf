variable "name" {
  description = "base name for asg"
}

variable "desired_capacity" {
    description = "desired capacity of instances"
    type = number 
}


variable "min_size" {
  description = "minumum number of instances "
  type = number
}

variable "max_size" {
  description = "maximum number of instances"
  type = number
}

variable "private_subnet_ids" {
  description = "private subnet id for asg"
  type = list(string)
}

variable "target-group-arn" {
  description = "target group arn for asg"
  type = string
}

variable "lt_id" {
  description = "launch template id for asg"
  type = string
}

variable "lt_version" {
  description = "version of launch template"
  type = string
}

variable "enable_scaling" {
  description = "enable scaling true/false"
  type = bool
  default = true
}

variable "target_cpu_utilization" {
  description = "Target cpu utilization percent number only"
  type = number
  default = 40
}

