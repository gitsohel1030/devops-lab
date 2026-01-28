output "ec2_id_out" {
  description = "ec2 instance id"
  value = aws_instance.project_ec2.id
}