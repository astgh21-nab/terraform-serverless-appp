resource "aws_lambda_function" "this" {
  for_each = var.lambdas

  function_name = each.value.function_name
  role          = var.iam_role_arn
  handler       = each.value.handler
  runtime       = each.value.runtime
  filename      = each.value.filename
  source_code_hash = filebase64sha256(each.value.filename)

  environment {
    variables = each.value.environment_variables
  }

  tags = var.tags
}
