variable "aws_region" {
  description = "AWS region"
  default     = "eu-central-1"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  default     = "getUsersFunction"
}

variable "lambda_zip_path" {
  description = "Path to Lambda zip file"
  default     = "lambda-code/my-lambda-1.zip"
}

variable "lambda_handler" {
  description = "Lambda handler"
  default     = "index.handler" 
}

variable "lambda_runtime" {
  description = "Runtime for Lambda function"
  default     = "nodejs18.x"
}

variable "api_name" {
  description = "API Gateway name"
  default     = "MyRestAPI"
}

variable "api_description" {
  description = "API Gateway description"
  default     = "API for user operations"
}

variable "api_resource_path" {
  description = "API resource path"
  default     = "users"
}

variable "stage_name" {
  description = "Deployment stage name"
  default     = "prod"
}
