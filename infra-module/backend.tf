terraform {
  # Remote state in S3. This is a partial configuration: the bucket
  # is passed at init time with -backend-config, so this file carries no
  # account-specific values. use_lockfile enables native S3 state locking,
  # with no DynamoDB table required (Terraform 1.10+).
  backend "s3" {
    bucket       = "eks-foundation-terraform-training123"
    key          = "eks-foundations-module/terraform.tfstate"
    encrypt      = true
    use_lockfile = true
  }
}
