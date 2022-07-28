variable "lambda_function_name" {
  description = "Unique name for your Lambda Function"
  default = "s3"
}

variable "aws_lambda_role_id" {
  description = "Id do lambda IAM role"
}

variable "aws_lambda_role_arn" {
  description = "ARN do lambda IAM role"
}

variable "tags_lambda" {

  description = "Tags do bucket da AWS"

  type = map(string)
  
  default = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

variable "aws_region" {

  description = "Região de onde o provedor AWS está"

  type = string
}

variable "sns_topic_arn" {

  description = "ARN do sns"

}