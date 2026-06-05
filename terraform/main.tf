module "vpc" {
  source = "./modules/vpc"

  vpc_cidr              = var.vpc_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

  environment = var.environment
}

module "eks" {
  source = "git::https://github.com/clouddrove/terraform-aws-eks.git?ref=v1.4.8"

  cluster_name = "devops-assessment"
  environment  = var.environment

  kubernetes_version = "1.33"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids

  managed_node_group_defaults = {
    ami_type       = "AL2023_x86_64_STANDARD"
    instance_types = ["t3.medium"]
  }

  managed_node_group = {
    default = {
      min_size     = 1
      max_size     = 1
      desired_size = 1

      capacity_type = "ON_DEMAND"

      subnet_ids = module.vpc.private_subnet_ids
    }
  }
}