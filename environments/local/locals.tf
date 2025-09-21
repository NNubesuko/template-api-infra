locals {
  project_name                = "<PROJECT_NAME>"
  environment                 = "local"
  aws_region                  = "ap-northeast-1"
  access_key                  = "DUMMY"
  secret_key                  = "DUMMY"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true
  localstack_endpoint_url     = "http://localhost:4566"

  suffix = {
    dynamodb = "dynamodb"
  }

  resource_prefixs = {
    dynamodb = "${local.project_name}-${local.environment}-${local.suffix.dynamodb}"
  }
}
