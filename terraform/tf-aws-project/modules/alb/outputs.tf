output "alb_dns_name" {
    value = aws_lb.tf_project_alb.dns_name
    description = "Public dns name of lb"
  
}

output "alb_arn" {
    value = aws_lb.tf_project_alb.arn
    description = "ALB arn "
  
}

output "target_group_arn" {
    value = aws_lb_target_group.tf_project_tg.arn
    description = "targer group arn for ASG attachment"  
}

