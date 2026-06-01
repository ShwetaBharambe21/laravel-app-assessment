variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_1" {}

variable "public_subnet_2" {}

variable "my_ip" {}