output "terraform_state_bucket_name" {
  description = "The name of the S3 bucket used for storing Terraform state"
  value       = data.aws_s3_bucket.terraform_state.id
}

output "lambda_bucket_name" {
  description = "The name of the Lambda bucket"
  value       = aws_s3_bucket.lambda_bucket.id
}

# output "lambda_function_arn" {
#   description = "The ARN of the Lambda function"
#   value       = aws_lambda_function.rust_lambda.arn
# }

# output "lambda_function_name" {
#   description = "The name of the Lambda function"
#   value       = aws_lambda_function.rust_lambda.function_name
# }

