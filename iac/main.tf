terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = "af-south-1"
  default_tags { tags = local.common_tags }
}

provider "github" {
  token = var.github_org_token
}    
