output "asg_name" {
  value = aws_autoscaling_group.tf_asg.name
  description = "auto scaling group name"
}