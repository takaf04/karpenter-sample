output "command_update_kubeconfig" {
  description = "kubeconfig command"
  value       = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.cluster_id}"
}