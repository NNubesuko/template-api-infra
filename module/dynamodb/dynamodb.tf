resource "aws_dynamodb_table" "users" {
  name         = "${var.resource_prefix_dynamodb}-users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  # 必要なら email をインデックスに追加
  global_secondary_index {
    name            = "email-index"
    hash_key        = "email"
    projection_type = "ALL"
  }

  attribute {
    name = "email"
    type = "S"
  }
}
