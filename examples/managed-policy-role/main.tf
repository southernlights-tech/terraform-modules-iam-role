
provider "aws" {
  region = "us-east-1"
}

module "iam_role_managed" {
  source = "../../"

  role_name = "my-managed-policy-role"
  env_short = "prod"

  assume_role_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

  managed_policies = ["AmazonS3ReadOnlyAccess"]
}

output "role_arn" {
  value = module.iam_role_managed.outputs.role_arn
}

output "role_name" {
  value = module.iam_role_managed.outputs.role_name
}
