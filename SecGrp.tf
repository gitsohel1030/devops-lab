resource "aws_security_group" "TF_demo_SG" {
  name        = "TF_demo_SG"
  description = "TF_demo_SG"
#   vpc_id      = aws_vpc.main.id

  tags = {
    Name = "TF_demo_SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_sshfromMyIP" {
  security_group_id = aws_security_group.TF_demo_SG.id
  cidr_ipv4         = "167.103.22.197/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.TF_demo_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_ALLOutbound_ipv4" {
  security_group_id = aws_security_group.TF_demo_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_AllOutBoud_ipv6" {
  security_group_id = aws_security_group.TF_demo_SG.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}