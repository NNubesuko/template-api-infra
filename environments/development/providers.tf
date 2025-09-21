provider "aws" {
  region = local.aws_region

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
