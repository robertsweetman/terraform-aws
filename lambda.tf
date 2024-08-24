# IAM role for the Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "rust_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# IAM policy attachment for basic Lambda execution
resource "aws_iam_role_policy_attachment" "lambda_basic" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_role.name
}

# S3 bucket to store the Lambda deployment package
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "rust-lambda-deployment-${random_string.bucket_suffix.result}"
}

resource "random_string" "bucket_suffix" {
  length  = 20
  special = false
  upper   = false
}

# Lambda function
resource "aws_lambda_function" "rust_lambda" {
  function_name = "rust_lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "bootstrap"
  runtime       = "provided.al2"
  s3_bucket     = aws_s3_bucket.lambda_bucket.id
  s3_key        = "rust_lambda.zip"

  environment {
    variables = {
      RUST_BACKTRACE = "1"
    }
  }
}