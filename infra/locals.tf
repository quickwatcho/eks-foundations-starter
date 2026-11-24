locals {
  name                 = var.cluster_name
  azs                  = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnet_offset = 128
  tags = merge(
    {
      Project   = "eks-foundation"
      ManagedBy = "terraform"
    },
    var.tags
  )
}
