output "cluster_name" {
  description = "The name of the EKS cluster"
  value = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value = aws_eks_cluster.this.endpoint
}   

output "cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value = aws_eks_cluster.this.version
}

output "node_group_name" {
  description = "The name of the default node group"
  value = aws_eks_node_group.this.node_group_name
}

output "update_kubeconfig_command" {
  description = "The command to update the kubeconfig for the EKS cluster"
  value       = "aws eks update-kubeconfig --name ${aws_eks_cluster.this.name}"
}
