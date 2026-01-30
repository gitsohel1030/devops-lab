# Application Load balancer Security group

resource "aws_security_group" "alb_sg" {
    name = "alb_sg"
    description = "alb sg"
    vpc_id = var.vpc_id_out
      
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_from_anywhere" {
    security_group_id = aws_security_group.alb_sg.id
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr_ipv4 = var.alb_ingress_ipv4cidr_http
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_from_anywhere" {
    security_group_id = aws_security_group.alb_sg.id
    from_port = 443
    to_port = 443
    ip_protocol = "tcp"
    cidr_ipv4 = var.alb_ingress_ipv4cidr
  
}


resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
    security_group_id = aws_security_group.alb_sg.id
    ip_protocol = "-1"
    cidr_ipv4 = var.alb_egress_ipv4cidr
  
}