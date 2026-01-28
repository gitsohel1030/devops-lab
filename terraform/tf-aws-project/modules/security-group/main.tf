resource "aws_security_group" "project_SG" {
  name        = "project_SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id_out

  tags = {
    Name = "project_SG"
    Name = "${var.environment}-SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_SSH_ingress_fromMyIP" {
  security_group_id = aws_security_group.project_SG.id
  cidr_ipv4         = var.ssh_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ALL_HTTP_ingress" {
  security_group_id = aws_security_group.project_SG.id
  cidr_ipv4         = var.http_ipv4_cidr
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  security_group_id = aws_security_group.project_SG.id
  cidr_ipv4         = var.egress_ipv4_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv6         = "::/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }