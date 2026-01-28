data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "project_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_type
  key_name = aws_key_pair.project_ec2_key.key_name
  vpc_security_group_ids = [ var.sec_grp_id_out ]
  subnet_id = var.subnet_id_out   #already gave avalability zone in subnet

  tags = {
    Name = "tf_project_ec2"
  }
}

