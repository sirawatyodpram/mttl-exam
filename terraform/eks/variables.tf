variable "subnet_ids" {}

variable "vpc_id" {}

variable "environment" {}

variable "project" {}

variable "common_tags" {
  type = map(string)
}

variable "region" {
}

variable "account_id" {
}

variable "control_plane_subnet_ids" {
}