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
  count = var.instance_count
  ami            = var.ami
  instance_type  = var.instance_type
  subnet_id      = var.subnet

  tags = {
    Name = "TERRAFORM-GURU-${count.index}"
  }
}

variable "instance_count" {
  type        = string
  default     = 2
}

variable "ami" {
  type    = string
  default = "ami-0729e439b6769d6ab"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet" {
  type    = string
  default = "<SUBNET_ID>"
}

output "aws_instances" {
  value = aws_instance.inst.*.tags.Name
}
