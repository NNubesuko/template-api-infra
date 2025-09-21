variable "resource_prefix_api_gateway" {
  description = "API Gatewayのリソース接頭辞"
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda関数の名前"
  type        = string
}

variable "lambda_function_arn" {
  description = "Lambda関数の ARN"
  type        = string
}
