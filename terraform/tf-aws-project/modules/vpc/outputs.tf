output "vpc_id_out" {
  description = "Id of VPC"
  value       = aws_vpc.tf-project-vpc.id
}


output "subnet_id_out" {
  description = "Id of VPC"
  value       = aws_subnet.tf_project_subnet_public.id
}