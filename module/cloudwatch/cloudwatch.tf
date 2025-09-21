resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.resource_prefix_lambda}-webapp"
  retention_in_days = 7
}
