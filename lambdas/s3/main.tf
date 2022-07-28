resource "aws_lambda_function" "s3" {
  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_function_name
  role          = var.aws_lambda_role_arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  tags = var.tags_lambda
}

resource "aws_lambda_permission" "s3" {
  statement_id = "AllowExecutionFroms3Bucket"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3.arn
  principal = "s3.amazonaws.com"
  source_arn = var.bucket_arn
}