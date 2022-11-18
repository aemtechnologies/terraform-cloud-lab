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
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet

  tags = {
    Name = "TERRAFORM-GURU-${count.index}"
  }
}

output "aws_instances" {
  value = aws_instance.inst.*.tags.Name
}
