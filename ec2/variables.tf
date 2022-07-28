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