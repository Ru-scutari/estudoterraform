output "aws_lambda_role_id" {
  value = aws_iam_role.iam_lambda_s3.id
}

output "aws_lambda_role_arn" {
  value = aws_iam_role.iam_lambda_s3.arn
}