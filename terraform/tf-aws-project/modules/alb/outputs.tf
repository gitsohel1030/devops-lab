output "alb_dns_name" {
    value = aws_lb.tf-project-alb.dns_name
    description = "Public dns name of lb"
  
}

output "alb_arn" {
    value = aws_lb.tf-project-alb.arn
    description = "ALB arn "
  
}

output "target-group-arn" {
    value = aws_lb_target_group.tf-project-tg.arn
    description = "target group arn for ASG attachment"  
}

output "target_group_arn_suffix" {
  value = aws_lb_target_group.tf-project-tg.arn_suffix
  description = "alb tg arn suffix"
}

output "alb_name" {
  value = aws_lb.tf-project-alb.name
  description = "name of alb"
}

