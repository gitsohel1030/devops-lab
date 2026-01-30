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

