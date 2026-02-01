
# ASG CPU Alarm
resource "aws_cloudwatch_metric_alarm" "asg_high_cpu" {
  alarm_name = "${var.asg_name}_high_cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 2
  metric_name = "ASGAverageCPUUtilization"
  namespace = "AWS/AutoScaling"
  period = 60
  statistic = "Average"
  threshold = var.cpu_alarm_threshold

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_description = "ASG average CPU is high"
}


# ASG Capacity Alarm
resource "aws_cloudwatch_metric_alarm" "asg_low_capacity" {
  alarm_name = "${var.asg_name}_low_capacity"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = 1
  metric_name = "GroupInServiceInstances"
  namespace = "AWS/AutoScaling"
  period = 60
  statistic = "Minimum"
  threshold = 1
  
  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_description = "ASG has insufficient running instances"

}


# ALB Healthy Target Alarm
resource "aws_cloudwatch_metric_alarm" "alb_unhealthy_targets" {
  alarm_name = "${var.asg_name}_unhealthy_targets"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = 1
  metric_name = "HealthyHostCount"
  namespace = "AWS/ApplicationELB"
  period = 60
  statistic = "Average"
  threshold = var.min_health_hosts

  dimensions = {
    LoadBalancer = var.alb_name
    TargetGroup  = var.target_group_arn_suffix
  }

  alarm_description = "ALB has unhealthy targets"
}