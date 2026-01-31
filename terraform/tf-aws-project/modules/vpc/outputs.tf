output "vpc_id_out" {
  description = "Id of VPC"
  value       = aws_vpc.tf_project_vpc.id
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_subnet_ids" {
  value = [for s in aws_subnet.private : s.id]
}


# output "public_route_table_id" {
#   description = "public route table id"
#   value = aws_route_table.public_rt.id
# }

# output "private_route_table_id" {
#   description = "private route table id"
#   value = aws_route_table.private_rt.id
# }

# output "igw_id" {
#   description = "internet gateway id"
#   value = aws_internet_gateway.tf_igw.id
# }