output "invoke_lambda" {
  value = aws_lambda_function.dynamo.invoke_arn
}

output "lambda_fuction_arn" {
  value = aws_lambda_function.dynamo.arn
}