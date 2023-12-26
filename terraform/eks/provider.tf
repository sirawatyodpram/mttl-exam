provider "aws" {
  region = "ap-southeast-1"
  default_tags {
    tags = var.common_tags
  }

}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.eks.cluster_name
    ]
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
     key            = "eks-exam/terraform.tfstate"
     region         = "ap-southeast-1"
     encrypt        = true
    #  dynamodb_table = "tfstate-ap-lock"
   }
}


