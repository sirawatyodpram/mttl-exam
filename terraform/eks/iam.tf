module "iam_assumable_role_with_eks_oidc" {
  source      = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name   = "role-with-oidc"

  role_policy_arns = {
    policy = "${module.exam_app_iam_policy.arn}",
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

module "exam_app_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"

  name        = "exam_app_iam_policy"
  path        = "/"
  description = "exam_app_iam_policy"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "s3",
			"Effect": "Allow",
			"Action": [
				"s3:PutObject",
				"s3:GetObject"
			],
			"Resource": "arn:aws:s3:::my-web-assets/*"
		},
		{
			"Sid": "sqs",
			"Effect": "Allow",
			"Action": [
				"sqs:DeleteMessage",
				"sqs:ReceiveMessage",
				"sqs:SendMessage"
			],
			"Resource": "arn:aws:sqs:ap-southeast-1:123456789123:lms-import-data"
		}
	]
}
EOF
}