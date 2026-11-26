resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${local.name}-default-node-group"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = module.vpc.private_subnets

  # Spot instance configuration can be added here if needed
  capacity_type  = "SPOT"
  instance_types = var.node_instance_types

  scaling_config {
    desired_size = var.node_desired_size
    min_size     = var.node_min_size
    max_size     = var.node_max_size
  }

  update_config {
    max_unavailable = 1
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  tags = local.tags

  depends_on = [aws_iam_role_policy_attachment.node, aws_eks_addon.vpc_cni, aws_eks_addon.kube_proxy]
}

