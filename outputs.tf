output "terraform_state_bucket_name" {
  description = "The name of the S3 bucket used for storing Terraform state"
  value       = aws_s3_bucket.terraform_state.id
}
