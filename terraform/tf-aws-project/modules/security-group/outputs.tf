output "sec_grp_id_out" {
  description = "Id of Security group"
  value       = aws_security_group.project_SG.id
}