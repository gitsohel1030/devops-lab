# tfsec:ignore:aws-elb-alb-not-public
resource "aws_lb" "tf-project-alb" {
  name               = "tf-project-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets = var.public_subnet_ids
  drop_invalid_header_fields = true

  tags = {
    environment = var.environment
  }
}

resource "aws_lb_target_group" "tf-project-tg" {
  name     = "tf-project-tg"
  port     = var.target_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id_out

  health_check {
    protocol = "HTTP"
    path = "/"
    matcher = "200-399"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }

  tags = {
    "Name" = "tf_project_tg"
  }
}


# tfsec:ignore:aws-elb-http-not-used
resource "aws_lb_listener" "tf_listener" {
    load_balancer_arn = aws_lb.tf-project-alb.arn
    port = var.listener_port
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.tf-project-tg.arn
    }
  
}

