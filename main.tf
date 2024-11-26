resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.main.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
}

resource "aws_subnet" "private_subnets" {
 count      = length(var.private_subnet_cidrs)
 vpc_id     = aws_vpc.main.id
 cidr_block = element(var.private_subnet_cidrs, count.index)
}

resource "aws_eks_cluster" "squad-2" {
  name     = "squad-2"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = resource.aws_vpc.main.id
  subnet_ids = resource.aws_subnet.private_subnet.id

  eks_managed_node_group_defaults = {
    disk_size = 50
  }

  eks_managed_node_groups = {
    general = {
      desired_size = 1
      min_size     = 1
      max_size     = 4

  instance_types = ["t2.micro"]
}
}
}

resource "aws_dynamodb_table" "squad2" {
  name             = "squad2-lock-table"
  hash_key         = "statelock"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "statelock"
    type = "S"
  }
}