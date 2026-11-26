module "eks" {
  source                                   = "terraform-aws-modules/eks/aws"
  version                                  = "~> 21.24.0"
  name                                     = local.name
  kubernetes_version                       = var.kubernetes_version
  authentication_mode                      = "API"
  enable_cluster_creator_admin_permissions = true
  endpoint_public_access                   = var.endpoint_public_access
  endpoint_public_access_cidrs             = var.public_access_cidrs
  vpc_id                                   = module.vpc.vpc_id
  subnet_ids                               = module.vpc.private_subnets
  tags                                     = local.tags

  upgrade_policy = {
    support_type = "STANDARD"
  }

  eks_managed_node_groups = {

    default = {
      instance_types   = var.node_instance_types
      capacity_type    = "SPOT"
      desired_capacity = var.node_desired_size
      min_capacity     = var.node_min_size
      max_capacity     = var.node_max_size
    }
  }
addons = {
  kube-proxy = {
    before_compute = true
  }
  vpc-cni = {
    before_compute = true
  }
  coredns = {}
}
}

