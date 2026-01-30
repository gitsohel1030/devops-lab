resource "aws_autoscaling_group" "tf_asg" {
  name = "${var.name}"
  desired_capacity = var.desired_capacity
  min_size = var.min_size
  max_size = var.max_size

  vpc_zone_identifier = [var.private_subnet_id]
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