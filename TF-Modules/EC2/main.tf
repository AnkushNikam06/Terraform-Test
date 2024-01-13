provider "aws" {
  region = var.region
}

resource "aws_instance" "tf-test" {
  ami = var.ami
  instance_type = var.instance_type
}