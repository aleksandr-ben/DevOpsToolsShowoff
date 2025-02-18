variable "region" {
  default = "eu-north-1"
}

provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "image_repo" {
  name                 = "app_image_repository"
  image_tag_mutability = "MUTABLE"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "app_cluster"
  cluster_version = "1.27"

  vpc_id     = data.aws_vpc.default.id
  subnet_ids = data.aws_subnets.default.ids

  enable_irsa                              = true
  cluster_endpoint_public_access           = true
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      min_size     = 3
      max_size     = 5
      desired_size = 3

      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }

  tags = {
    Env       = "dev"
    Terraform = "true"
  }
}

