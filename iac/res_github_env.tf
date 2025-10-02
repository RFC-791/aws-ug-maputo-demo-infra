resource "github_actions_organization_variable" "ecs_cluster_name" {
  variable_name = "AWS_UG_MAPUTO_ECS_CLUSTER_NAME"
  visibility    = "private"
  value         = aws_ecs_cluster.cluster.name
}

resource "github_actions_organization_variable" "lb_name" {
  variable_name = "AWS_UG_MAPUTO_LB_DNS_NAME"
  visibility    = "private"
  value         = aws_lb.ingress.dns_name
}

resource "github_actions_organization_variable" "lb_arn" {
  variable_name = "AWS_UG_MAPUTO_LB_ARN"
  visibility    = "private"
  value         = aws_lb.ingress.arn
}
