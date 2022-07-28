variable "service_name" {

    description = "The username for the user"

    default = "aulaserverless"  
}

variable "cognito_arn" {
  
  description = "ARN cognito"
}

variable "aws_lambda_function_dynamo" {
  
  description = ""
}
