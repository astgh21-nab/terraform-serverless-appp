variable "db_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "DynamoDB_table"

}

variable "partition_key" {
  description = "Name of the partition key (hash key)"
  type        = string
  default     = "id"

}

variable "partition_key_type" {
  description = "Type of the partition key (S | N | B)"
  type        = string
  default     = "S"
}
variable "billing_mode" {
  description = "for PAY_PER_REQUEST"
  default     = "PAY_PER_REQUEST"
  type        = string
}
variable "db_tags" {
  description = "Tags to apply to the DynamoDB table"
  type        = map(string)
  default     = {}
}
