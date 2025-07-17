variable "ami" {
  type = string
  description = "AMI to be used by ec2 instance"
  default = "ami-xxxxxxxx"
}

variable "availability_zone" {
  type = string
  description = "AZ to be used by instance"
}

variable "instance_type" {
  type = string
  description = "Instance type to be used while launching the instance"
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
  description = "Subnet ID to be used by instance for networking purposes"
  default = "subnet-xxxxxxxx"
}

variable "vpc_id" {
  type = string
  description = "VPC in which EC2 instance will be launched"
  default = "vpc-xxxxxxxx"
}

variable "cidr_block" {
  type = list(number)
  description = "CIDR block to be used by environment"
  default = [ "0.0.0.0/0", "10.1.0.1/32" ]
}

variable "common_tags" {
  type = map(string)
  description = "Tag assigned to the resources"
  default = {
    "name" = "sample_deployment"
    "environment" = "production"
  }
}

variable "region" {
  type = string
  description = "A region defined at provider"
  default = "us-east-1"
}
