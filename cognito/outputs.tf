output "cognito_id" {
  value = aws_cognito_user.aulaserverlessuser.id
}

output "cognito_username" {
  value = aws_cognito_user.aulaserverlessuser.username
}