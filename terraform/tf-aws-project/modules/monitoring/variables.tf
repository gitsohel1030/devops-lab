variable "asg_name" {
  description = "asg name"
  type = string
}

variable "cpu_alarm_threshold" {
  type = number
  default = 80
}

variable "alb_name" {
  type = string
  description = "alb name"
}

variable "target_group_arn_suffix" {
  type = string
  description = "target group arn suffix"
}

variable "min_health_hosts" {
  type = number
  default = 1
}