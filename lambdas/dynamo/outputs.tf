output "invoke_lambda" {
  value = aws_lambda_function.dynamo.invoke_arn
}