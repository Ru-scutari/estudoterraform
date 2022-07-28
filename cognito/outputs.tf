output "cognito_id" {
  value = aws_cognito_user_pool.aulaserverless.id
}

output "cognito_username" {
  value = aws_cognito_user_pool.aulaserverless.username_attributes
}

output "cognito_arn" {
  value = aws_cognito_user_pool.aulaserverless.arn
}