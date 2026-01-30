resource "aws_security_group" "ec2_sg" {
    name = "ec2_sg"
    description = "ec2 sg"
    vpc_id = var.vpc_id_out
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_from_alb_sg" {
    security_group_id = aws_security_group.ec2_sg.id
    from_port = var.ec2_port
    to_port = var.ec2_port
    ip_protocol = "tcp"
    referenced_security_group_id = var.alb_sg_id
  
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress_backend" {
    security_group_id = aws_security_group.ec2_sg
    ip_protocol = "-1"
    cidr_ipv4 = var.egress_ipv4
  
}