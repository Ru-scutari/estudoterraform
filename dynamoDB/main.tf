resource "aws_dynamodb_table" "dynamodb-table-aulaserverless" {
  name           = var.service_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }
 
 tags = var.tags_dynamo
}