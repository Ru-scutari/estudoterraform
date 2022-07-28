variable "service_name" {

    description = "The username for the user"

    default = "aulaserverless"  
}

variable "hash_key" {

    description = "Attribute to use as the hash (partition) key. Primary Key."

    default = "serverlessID"  
}

variable "tags_dynamo" {

  description = "Tags do bucket da AWS"

  type = map(string)
  
  default = {
    Name        = "dynamodb-table-1"
    Environment = "Dev"
  }
}