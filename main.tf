terraform {

  required_version = ">= 0.14.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.25"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "inst" {
  count         = 2
  ami           = "<AMI>"
  instance_type = "<INSTANCE_TYPE>"
  subnet_id     = "<SUBNET_ID>"

  tags = {
    Name = "GURU-${count.index}"
  }
}
