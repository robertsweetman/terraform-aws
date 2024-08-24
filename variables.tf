variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2" # You can change this to your preferred region
}

variable "lambda_function_name" {
  description = "test lambda function"
  type        = string
  default     = "rust_lambda_function"
}

variable "sender_email" {
  description = "sender email for SES"
  type        = string
  default     = "robertiansweetman@gmail.com"
}

variable "recipient_email" {
  description = "recipient email for SES"
  type        = string
  default     = "robertsweetman@pm.me"
}