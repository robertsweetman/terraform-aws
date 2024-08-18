terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # We'll configure the backend later
  # backend "s3" {}
}

provider "aws" {
  region = var.aws_region

  # These will be set using GitHub Secrets
  #   access_key = aws_iam_access_key.terraform_user_key.id
  #   secret_key = aws_iam_access_key.terraform_user_key.secret
}

resource "aws_iam_access_key" "terraform_user_key" {
  user = aws_iam_user.terraform_user.name
}