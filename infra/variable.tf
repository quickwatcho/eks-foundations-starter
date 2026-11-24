
### Networking

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "eks-foundation"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

### Shared

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "enable_nat_gateway" {
  description = "Whether to deploy a NAT gateway to enable access from private subnets to the internet"
  type        = bool
  default     = false
}


### EKS

variable "kubernetes_version" {
  description = "The version of the control plane and managed add-ons"
  type        = string
  default     = "1.36"
}

variable "endpoint_public_access" {
  description = "Whether the EKS cluster endpoint is publicly accessible outside the VPC"
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "The CIDR blocks that are allowed to access the EKS cluster endpoint when it is publicly accessible"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
