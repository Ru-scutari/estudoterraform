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

variable "instance_type" {

  description = "Tipo de máquina virutal que será criada na AWS"

  type = string
  
  default = "t3.micro"
}

variable "tags_instance" {

  description = "Tags da máquina virtual da AWS"

  type = map(string)
  
  default = {
    Name = "MinhaPrimeiraInstancia"
  }
}