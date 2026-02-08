# resource "aws_dynamodb_table" "tf_state_locks" {
#   name = "tf_state_locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     name = "tf-state-lock"
#   }

# }