resource "aws_key_pair" "TF_demo_key" {
  key_name   = "TF_demo_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPIemyhpAexgUOcYmNRsTeOv4n6LjPwjMHZIB5KYsW8s"
}