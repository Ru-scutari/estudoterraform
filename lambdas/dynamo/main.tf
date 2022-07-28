resource "aws_lambda_function" "dynamo" {
  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_function_name
  role          = var.aws_lambda_role_arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  tags = var.tags_lambda
}

resource "aws_lambda_permission" "api_gateway" {
  statement_id = "AllowExecutionApiGateway"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.dynamo.arn
  principal = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.aws_region}:${var.aws_account_id}:*/*"
}