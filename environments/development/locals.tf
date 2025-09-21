locals {
  project_name      = "<PROJECT_NAME>"
  environment       = "development"
  aws_region        = "ap-northeast-1"
  account_id        = "<ACCOUNT_ID>"
  github_user       = "<GITHUB_USER>"
  github_repository = "<GITHUB_REPOSITORY>"

  suffix = {
    iam_role    = "iam-role"
    iam_policy  = "iam-policy"
    api_gateway = "api-gateway"
    ecr         = "ecr"
    lambda      = "lambda"
    ssm         = "ssm"
    dynamodb    = "dynamodb"
  }

  runtime = {
    lambda = "nodejs20.x"
  }

  resource_prefixs = {
    iam_role    = "${local.project_name}-${local.environment}-${local.suffix.iam_role}"
    iam_policy  = "${local.project_name}-${local.environment}-${local.suffix.iam_policy}"
    api_gateway = "${local.project_name}-${local.environment}-${local.suffix.api_gateway}"
    ecr         = "${local.project_name}-${local.environment}-${local.suffix.ecr}"
    lambda      = "${local.project_name}-${local.environment}-${local.suffix.lambda}"
    ssm         = "/${local.project_name}/${local.environment}/${local.suffix.ssm}"
    dynamodb    = "${local.project_name}-${local.environment}-${local.suffix.dynamodb}"
  }

  iam_role_AWSLambdaBasicExecutionRole = {
    arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  }

  # GitHub の OIDC プロバイダー情報で thumbprint_list は2つ必要になった
  # https://github.blog/changelog/2023-06-27-github-actions-update-on-oidc-integration-with-aws/
  iam_openid_GitHubActions = {
    url = "https://token.actions.githubusercontent.com"
    thumbprint_list = [
      "6938fd4d98bab03faadb97b34396831e3780aea1",
      "1c58a3a8518e8759bf075b76b750d4f2df264fcd"
    ]
  }

  iam_role_GitHubActionsRole = {
    federated = "arn:aws:iam::${local.account_id}:oidc-provider/token.actions.githubusercontent.com"
    string_equals = {
      variable = "token.actions.githubusercontent.com:aud"
      value    = "sts.amazonaws.com"
    }
    string_like = {
      variable = "token.actions.githubusercontent.com:sub"
      value    = "repo:${local.github_user}/${local.github_repository}:environment:development"
    }
  }

  iam_role_policy_GitHubActionsPolicy = {
    resource = "arn:aws:lambda:ap-northeast-1:${local.account_id}:function:${local.resource_prefixs.lambda}-webapp"
  }
}
