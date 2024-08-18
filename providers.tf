terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # backend state is held in S3
  backend "s3" {
    bucket = "tfstate-rs-${random_string.bucket_suffix.result}"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = var.aws_region
}

# already have one of these
# resource "aws_iam_access_key" "terraform_user_key" {
#   user = aws_iam_user.terraform_user.name
# }