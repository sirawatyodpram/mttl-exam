provider "aws" {
  region = "ap-southeast-1"
  default_tags {
    tags = var.common_tags
  }
}
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

   backend "s3" {
     bucket         = "scg-test-state"
     key            = "vpc-exam/terraform.tfstate"
     region         = "ap-southeast-1"
     encrypt        = true
    #  dynamodb_table = "tfstate-ap-lock"
   }
}