resource "aws_lambda_function" "s3" {
  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_function_name
  role          = var.aws_lambda_role_arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  tags = var.tags_lambda
}