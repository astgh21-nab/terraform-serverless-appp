
resource "aws_dynamodb_table" "dynamodb_tb" {
  name         = var.db_table_name
  billing_mode = var.billing_mode
  hash_key     = var.partition_key

  attribute {
    name = var.partition_key
    type = var.partition_key_type
  }

  tags = var.db_tags
}
