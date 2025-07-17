variable "region" {
  type = string
  description = "A region defined at provider"
  default = "us-east-1"
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
