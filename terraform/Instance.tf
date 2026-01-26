resource "aws_instance" "web" {
  ami           = data.aws_ami.amiID.id
  instance_type = "t3.micro"
  key_name  = "TF_demo_key"
  vpc_security_group_ids    =   [ aws_security_group.TF_demo_SG.id ]
  availability_zone     =   "ap-south-1a"

  tags = {
    Name = "TF_web_Instance"
    project =   "TF_Demo"

  }
}

resource "aws_ec2_instance_state" "web_state" {
  instance_id   =   aws_instance.web.id
  state   =   "running"
}