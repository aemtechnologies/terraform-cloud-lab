variable "instance_count" {
  description = "Number of Instances"
  type        = string
  default     = 2
}

variable "ami" {
    type = string
    default = "ami-0729e439b6769d6ab"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "subnet" {
  description = "AWS Subnet"
  type        = string
  default     = "<SUBNET_ID>"
}
