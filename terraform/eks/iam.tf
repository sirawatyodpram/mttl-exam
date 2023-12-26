# module "iam_assumable_role_with_eks_oidc" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"

#   create_role = true

#   role_name = "role-with-oidc"

#   tags = {
#     Role = "role-with-oidc"
#   }

#   provider_url = module.eks.oidc_provider_arn

#   role_policy_arns = [
#     "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
#   ]
#   number_of_role_policy_arns = 1
# }

module "iam_assumable_role_with_eks_oidc" {
  source      = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name   = "role-with-oidc"

  role_policy_arns = {
    s3_policy = "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    sqs_policy = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
  }

  # attach_vpc_cni_policy = true
  # vpc_cni_enable_ipv4   = true

  oidc_providers = {
    main = {
      provider_arn               = "${module.eks.oidc_provider_arn}"
      namespace_service_accounts = ["demo:demo-sa"]
    }
  }
}