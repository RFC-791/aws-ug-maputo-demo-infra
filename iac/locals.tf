locals {
  common_tags = {
    GitRepo     = var.git_repo
    Application = "aws-ug-maputo-app"
    Environment = "pre-production"
  }
}
