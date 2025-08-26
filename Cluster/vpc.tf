module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.14.0"

  name = format("%s-vpc", var.eks_name)
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = var.subnets_private
  public_subnets  = var.subnets_public

  enable_nat_gateway = true

  private_subnet_tags = {
    "Name"                                  = format("%s-sub-private", var.eks_name),
    "kubernetes.io/role/internal-elb"       = 1,
    "kubernetes.io/cluster/${var.eks_name}" = "shared"
  }

  public_subnet_tags = {
    "Name"                                  = format("%s-sub-public", var.eks_name)
    "kubernets/io/role/elb"                 = 1,
    "kubernetes.io/cluster/${var.eks_name}" = "shared"
  }
}

