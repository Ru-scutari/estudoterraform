variable "aws_region" {

  description = "Região de onde o provedor AWS está"

  type = string
}

variable "bucket_nome" {

  description = "Nome do bucket que será criado na AWS"

  type = string
  
  default = "coloque-um-nome-unico"
}

variable "tags_bucket" {

  description = "Tags do bucket da AWS"

  type = map(string)
  
  default = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

variable "aws_lambda_role_arn" {
  description = "ARN do lambda IAM role"
}