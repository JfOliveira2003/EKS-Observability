module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.26.0"
  cluster_name    = var.eks_name
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    eks_nodes = {
      min_size     = 2
      max_size     = 6
      desired_size = 3

      instance_type = ["t3a.small"]
    }
  }

}

output "cluster_name" {
  value       = module.eks.cluster_name
  description = "The name of the created EKS cluster."
}

output "cluster_version" {
  value       = module.eks.cluster_version
  description = "The version of Kubernetes running on the EKS cluster."
}

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "The endpoint for the EKS Kubernetes API server."
}
