resource "aws_iam_role" "service_role" {
  name                 = local.role_name
  assume_role_policy   = var.assume_role_policy_document
  path                 = var.path
  max_session_duration = var.max_session_duration # Optional, can be set in variables
}

resource "aws_iam_policy" "service_policy" {
  count       = length(var.policy_statements) > 0 ? 1 : 0
  name        = "${var.role_name}-${var.env_short}"
  description = var.policy_description
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      for statement in var.policy_statements : {
        Effect    = statement.Effect
        Action    = statement.Action
        Resource  = statement.Resource
        Condition = statement.Condition != null ? statement.Condition : {}
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  count      = length(var.policy_statements) > 0 ? 1 : 0
  role       = aws_iam_role.service_role.name
  policy_arn = aws_iam_policy.service_policy[0].arn
}

data "aws_partition" "current" {}

resource "aws_iam_role_policy_attachment" "managed_policies" {
  count      = length(var.managed_policies)
  policy_arn = format("%s/%s", local.aws_policy_prefix, local.managed_policies[count.index])
  role       = aws_iam_role.service_role.name
}
