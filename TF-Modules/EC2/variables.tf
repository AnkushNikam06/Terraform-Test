variable "region" {
  type = string
  default = "us-east-1"
}

variable "ami" {
  type = string
  default = "ami-0005e0cfe09cc9050"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}