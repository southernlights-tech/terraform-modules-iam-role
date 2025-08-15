locals {
  aws_policy_prefix = format("arn:%s:iam::aws:policy", join("", data.aws_partition.current[*].partition))
  managed_policies  = sort(var.managed_policies)

  role_name = var.append_environment_to_role_name ? "${var.role_name}-${var.env_short}" : var.role_name
}
