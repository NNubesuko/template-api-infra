output "lambda_execution_role_arn" {
  value = module.iam.lambda_execution_role_arn
}

output "github_actions_role_arn" {
  value = module.iam.github_actions_role_arn
}
