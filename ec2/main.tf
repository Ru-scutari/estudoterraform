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

resource "aws_instance" "ec2-web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = var.tags_instance
}