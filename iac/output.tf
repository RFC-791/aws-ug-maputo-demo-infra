output "load_balancer_hostname" {
  description = "Load balancer hostname"
  value       = aws_lb.ingress.dns_name
}

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.cluster.name
}

