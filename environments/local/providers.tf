provider "aws" {
  region                      = local.aws_region
  access_key                  = local.access_key
  secret_key                  = local.access_key
  skip_credentials_validation = local.skip_credentials_validation
  skip_metadata_api_check     = local.skip_metadata_api_check
  skip_requesting_account_id  = local.skip_requesting_account_id
  s3_use_path_style           = local.s3_use_path_style
  endpoints {
    dynamodb = local.localstack_endpoint_url
  }

  default_tags {
    tags = {
      Project     = local.project_name
      Environment = local.environment
      IaC         = "terraform"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.0.0"
}
