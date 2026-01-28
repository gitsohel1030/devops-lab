resource "aws_key_pair" "project_ec2_key" {
  key_name   = "project_ec2_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPIemyhpAexgUOcYmNRsTeOv4n6LjPwjMHZIB5KYsW8s"
}