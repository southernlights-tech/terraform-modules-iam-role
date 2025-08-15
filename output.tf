output "outputs" {
  value = {
    policy_arn  = length(var.policy_statements) > 0 ? aws_iam_policy.service_policy[0].arn : ""
    policy_name = length(var.policy_statements) > 0 ? aws_iam_policy.service_policy[0].name : ""
    role_arn    = aws_iam_role.service_role.arn
    role_name   = aws_iam_role.service_role.name
  }
}
