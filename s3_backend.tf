resource "aws_s3_bucket" "terraform_state" {
  bucket = "tfstate-rs-${random_string.bucket_suffix.result}"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Once the S3 bucket is created, uncomment and update the backend configuration in providers.tf
# terraform {
#   backend "s3" {
#     bucket = "tfsate-backend"
#     key    = "terraform.tfstate"
#     region = "eu-west-2"  # Make sure this matches your provider's region
#   }
# }