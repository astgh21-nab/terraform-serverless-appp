variable "policy_name" {
  description = " for dynamodb_policy_name"
  default     = "dynamodb_policy"
  type        = string
}

variable "role_name" {
  description = " for role_name"
  default     = "lambda_role"
  type        = string
}

variable "role_version" {
  description = "IAM policy version"
  type        = string
  default     = "2012-10-17"
}

variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default = {
    tag-key = "tag-value"
  }
}

variable "assume_role_servicee" {
  description = "AWS service that will assume the role (e.g., lambda.amazonaws.com)"
  type        = string
  default     = "lambda.amazonaws.com"
}

variable "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table Lambda needs to access"
  type        = string
}

variable "allowed_actions" {
  description = "List of allowed DynamoDB actions"
  type        = list(string)
  default     = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:UpdateItem"]
}
