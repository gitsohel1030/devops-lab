resource "aws_autoscaling_group" "tf_asg" {
  name = "${var.name}"
  desired_capacity = var.desired_capacity
  min_size = var.min_size
  max_size = var.max_size

  vpc_zone_identifier = var.private_subnet_ids
  target_group_arns = [var.target-group-arn]

  launch_template {
    id = var.lt_id
    version = var.lt_version
  }
  
  health_check_type = "ELB"
  health_check_grace_period = 300

  termination_policies = ["OldestInstance"]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key = "Name"
    value = "${var.name}-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "cpu_target_tracking" {
  count = var.enable_scaling  ?  1 : 0
  name = "${var.name}-cpu_target_tracking"
  autoscaling_group_name = aws_autoscaling_group.tf_asg.name
  policy_type = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_cpu_utilization
  }
}