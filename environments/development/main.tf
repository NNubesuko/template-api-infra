module "iam" {
  source = "../../module/iam"

  resource_prefix_iam_role             = local.resource_prefixs.iam_role
  resource_prefix_iam_policy           = local.resource_prefixs.iam_policy
  dynamodb_users_table_arn             = module.dynamodb.dynamodb_users_table_arn
  iam_role_AWSLambdaBasicExecutionRole = local.iam_role_AWSLambdaBasicExecutionRole
  iam_openid_GitHubActions             = local.iam_openid_GitHubActions
  iam_role_GitHubActionsRole           = local.iam_role_GitHubActionsRole
  iam_role_policy_GitHubActionsPolicy  = local.iam_role_policy_GitHubActionsPolicy

  # 依存関係であることを明示
  depends_on = [module.dynamodb]
}

module "cloudwatch" {
  source = "../../module/cloudwatch"

  resource_prefix_lambda = local.resource_prefixs.lambda
}

module "api-gateway" {
  source = "../../module/api-gateway"

  resource_prefix_api_gateway = local.resource_prefixs.api_gateway
  lambda_function_name        = module.lambda.lambda_function_name
  lambda_function_arn         = module.lambda.lambda_function_arn

  # 依存関係であることを明示
  depends_on = [module.lambda]
}

module "ecr" {
  source = "../../module/ecr"

  resource_ecr_prefix = local.resource_prefixs.ecr
}

module "lambda" {
  source = "../../module/lambda"

  resource_prefix_lambda    = local.resource_prefixs.lambda
  repository_url            = module.ecr.repository_url
  lambda_execution_role_arn = module.iam.lambda_execution_role_arn

  # 依存関係であることを明示
  depends_on = [module.iam, module.ecr]
}

module "dynamodb" {
  source = "../../module/dynamodb"

  resource_prefix_dynamodb = local.resource_prefixs.dynamodb
}
