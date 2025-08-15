
provider "aws" {
  region = "us-east-1"
}

module "iam_role_basic" {
  source = "../../"

  role_name = "my-basic-service-role"
  env_short = "dev"

  assume_role_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

  policy_statements = [
    {
      Effect   = "Allow"
      Action   = ["s3:GetObject"]
      Resource = ["arn:aws:s3:::my-example-bucket/*"]
    },
  ]
}

output "role_arn" {
  value = module.iam_role_basic.outputs.role_arn
}

output "role_name" {
  value = module.iam_role_basic.outputs.role_name
}
