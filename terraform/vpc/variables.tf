variable "project" {
  type        = string
  description = "The name of the project."
}

variable "environment" {
  type        = string
  description = "The name of the environment."
}

variable "common_tags" {
  type = map(string)
}

variable "region" {}

variable "cidr" {}

variable "azs" {}

variable "private_subnets" {}

variable "public_subnets" {}

variable "database_subnets" {}

variable "enable_nat_gateway" {}

variable "single_nat_gateway" {}

variable "one_nat_gateway_per_az" {}

variable "create_database_subnet_group" {}

variable "enable_dns_support" {}

variable "enable_dns_hostnames" {}