output "lt_id" {
  value = aws_launch_template.tf_launch_template.id
  description = "launch template id"
}

output "lt_version" {
  value = aws_launch_template.tf_launch_template.latest_version
  description = "Latest launch template version"
}