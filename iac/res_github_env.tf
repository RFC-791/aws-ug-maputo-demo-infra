data "github_organization" "org" {
  full_name = "RFC-791"
}

resource "github_actions_organization_variable" "ecs_cluster_name" {
  variable_name           = "AWS_UG_MAPUTO_ECS_CLUSTER_NAME"
  visibility              = "selected"
  value                   = aws_ecs_cluster.cluster.name
  selected_repository_ids = data.github_organization.org.repositories
}

resource "github_actions_organization_variable" "lb_name" {
  variable_name           = "AWS_UG_MAPUTO_LB_DNS_NAME"
  visibility              = "selected"
  value                   = aws_lb.ingress.dns_name
  selected_repository_ids = data.github_organization.org.repositories
}

resource "github_actions_organization_variable" "lb_arn" {
  variable_name           = "AWS_UG_MAPUTO_LB_ARN"
  visibility              = "selected"
  value                   = aws_lb.ingress.arn
  selected_repository_ids = data.github_organization.org.repositories
}


