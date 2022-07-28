terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

}

resource "aws_s3_bucket" "meu-bucket-teste" {
  bucket = "${var.bucket_nome}-${var.environment}"

  tags = var.tags_bucket
}

resource "aws_s3_bucket_acl" "meu-bucket-teste-acl" {
  bucket = aws_s3_bucket.meu-bucket-teste.id
  acl    = "private"
}