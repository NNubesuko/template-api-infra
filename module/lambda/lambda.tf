resource "aws_lambda_function" "web" {
  function_name = "${var.resource_prefix_lambda}-webapp"

  package_type = "Image"
  image_uri    = "${var.repository_url}:dummy"
  role         = var.lambda_execution_role_arn

  architectures = ["x86_64"]
  memory_size   = 128
  timeout       = 30

  lifecycle {
    ignore_changes = [image_uri]
  }
}
