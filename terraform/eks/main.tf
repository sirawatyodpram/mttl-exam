data "aws_caller_identity" "current" {}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21"

  cluster_name    = "${var.project}-${var.environment}-eks-cluster"
  cluster_version = "1.28"

  cluster_endpoint_public_access  = true



  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.control_plane_subnet_ids
  cluster_enabled_log_types       = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # EKS Managed Node Group(s)
#   eks_managed_node_group_defaults = {
#     instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
#   }

  # eks_managed_node_groups = {
  #   group_a = {
  #     min_size     = 1
  #     max_size     = 10
  #     desired_size = 1

  #     instance_types = ["t3.micro"]
  #     capacity_type  = "SPOT"
  #     iam_role_name  = "${var.project}-${var.environment}-cluster-managed-node"
	# 		iam_role_additional_policies = {
	# 				AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
	# 		}
  #   }
  # }

  # Fargate Profile(s)
  fargate_profiles = {
    default = {
      name = "default"
      selectors = [
        {
          namespace = "default"
        },
        {
          namespace = "demo"
        },
        {
          namespace = "kube-system"
        }
      ]
    }
  }

  # aws-auth configmap
  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/r_aws-admin"
      username = "admin:{{SessionName}}"
      groups   = ["system:masters"]
    }
  ]

  aws_auth_accounts = [
    "${data.aws_caller_identity.current.account_id}"
  ]
}