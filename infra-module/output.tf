output "cluster_name" {
  description = "The name of the EKS cluster"
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value = module.eks.cluster_endpoint
}   

output "cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value = module.eks.cluster_version
}

output "update_kubeconfig_command" {
  description = "The command to update the kubeconfig for the EKS cluster"
  value       = "aws eks update-kubeconfig --name ${module.eks.cluster_name}"
}
