### ----------- outputs for  all module --------- ##########

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}

output "dynamodb_table_arn" {
  value = module.dynamodb.table_arn
}
output "role_arn" {
  description = "ARN of the IAM role"
  value       = module.iam.role_arn
}

output "lambda_arns" {
  description = "Lambda ARNs from the module"
  value       = module.lambda.lambda_arns
}


