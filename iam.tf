# don't need a duplicate of this
# resource "aws_iam_policy" "terraform_policy" {
#   name        = "TerraformPolicy"
#   path        = "/"
#   description = "IAM policy for Terraform operations"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "s3:*",
#           "lambda:*",
#           "iam:*",
#           "cloudwatch:*",
#           "dynamodb:*"
#           // Add other necessary services here
#         ]
#         Resource = "*"
#       }
#     ]
#   })
# }

# resource "aws_iam_user" "terraform_user" {
#   name = "terraform-user"
# }

# resource "aws_iam_user_policy_attachment" "terraform_user_policy" {
#   user       = aws_iam_user.terraform_user.name
#   policy_arn = aws_iam_policy.terraform_policy.arn
# }