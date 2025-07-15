output "lambda_arns" {
  description = "ARNs of the deployed Lambda functions"
  value = { for k, lambda in aws_lambda_function.this : k => lambda.arn }
}
