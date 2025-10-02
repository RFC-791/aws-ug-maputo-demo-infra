locals {
  prefix = "aws-ug-maputo"
  common_tags = {
    GitRepo     = var.git_repo
    Application = "aws-ug-maputo-app"
    Environment = "pre-production"
  }
}
