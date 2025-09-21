module "dynamodb" {
  source = "../../module/dynamodb"

  resource_prefix_dynamodb = local.resource_prefixs.dynamodb
}
