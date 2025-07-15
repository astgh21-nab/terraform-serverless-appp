output "role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.lambda_role.arn
}
