variable "lambdas" {
  description = "Map of Lambda functions to deploy"
  type = map(object({
    function_name        = string
    handler              = string
    runtime              = string
    filename             = string
    environment_variables = map(string)
  }))
}

variable "iam_role_arn" {
  description = "IAM Role ARN to attach to the Lambda function"
  type        = string
}

variable "tags" {
  description = "Tags for the Lambda functions"
  type        = map(string)
  default     = {}
}
