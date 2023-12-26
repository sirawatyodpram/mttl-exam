project       = "mttl"
environment   = "exam"
region        = "ap-southeast-1"

cidr = "10.0.0.0/16"

azs              = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
private_subnets  = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
public_subnets   = ["10.0.0.0/24", "10.0.2.0/24", "10.0.4.0/24"]
database_subnets = ["10.0.6.0/24", "10.0.7.0/24"]

enable_nat_gateway     = true
single_nat_gateway     = true
one_nat_gateway_per_az = false

create_database_subnet_group = true

enable_dns_hostnames = false
enable_dns_support   = true

common_tags = {
  Project : "Mttl",
  Environment : "Exam",
  Terraform : "True"
}