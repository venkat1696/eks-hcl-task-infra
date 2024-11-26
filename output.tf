output "eks_cluster_name" {
  value = aws_eks_cluster.my_eks_cluster.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.my_eks_cluster.endpoint
}

output "eks_cluster_arn" {
  value = aws_eks_cluster.my_eks_cluster.arn
}

output "ecr_repo_url" {
  value = aws_ecr_repository.my_ecr_repo.repository_url
}
