resource "aws_api_gateway_rest_api" "aulaserverless" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "aulaserverless"
      version = "1.0"
    }
  })

  name = var.service_name

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "v1" {
  parent_id = aws_api_gateway_rest_api.aulaserverless.root_resource_id
  path_part = "v1"
  rest_api_id = aws_api_gateway_rest_api.aulaserverless.id
}

resource "aws_api_gateway_authorizer" "aulaserverless" {
  name = "CognitoUserPoolAuthorizer"
  type = "COGNITO_USER_POOLS"
  rest_api_id = aws_api_gateway_rest_api.aulaserverless.id
  provider_arns = var.cognito_arn

}

resource "aws_api_gateway_method" "any" {
  authorization = "COGNITO_USER_POOLS"
  http_method = "ANY"
  resource_id = aws_api_gateway_resource.v1.id
  rest_api_id = aws_api_gateway_authorizer.aulaserverless.id
  authorizer_id = aws_api_gateway_authorizer.aulaserverless.id
}

resource "aws_api_gateway_integration" "aulaserverless" {

    rest_api_id = aws_api_gateway_authorizer.aulaserverless.id
    resource_id = aws_api_gateway_resource.v1.id
    http_method = aws_api_gateway_method.any.http_method
    integration_http_method = "POST"
    type = "AWS_PROXY"
    uri = var.aws_lambda_function_dynamo  
}

resource "aws_api_gateway_deployment" "aulaserverless" {
  rest_api_id = aws_api_gateway_authorizer.aulaserverless.id
  stage_name = "dev"
  depends_on = [
    aws_api_gateway_integration.aulaserverless
  ]
}