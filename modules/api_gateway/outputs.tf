output "api_invoke_url" {
  description = "Base Invoke URL for the deployed API"
  value       = "https://${aws_api_gateway_rest_api.my_api.id}.execute-api.${var.aws_region}.amazonaws.com/${var.stage_name}/${var.api_resource_path}"
}
