resource "aws_cognito_user_pool" "aulaserverless" {
  name = var.service_name
}

resource "aws_cognito_user_pool_client" "client" {
  name = var.service_name

  user_pool_id = aws_cognito_user_pool.aulaserverless.id

  generate_secret     = false

  allowed_oauth_flows = ["implicit"]

  allowed_oauth_flows_user_pool_client = true

  allowed_oauth_scopes = ["openid"]

  callback_urls = "http://localhost:3000"

  supported_identity_providers = [ "COGNITO" ]
}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = var.service_name
  user_pool_id = aws_cognito_user_pool.aulaserverless.id
}