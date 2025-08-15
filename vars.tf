variable "role_name" {
  description = "The name of the IAM role."
  type        = string
}

variable "assume_role_policy_document" {
  description = "The policy document that grants permission to assume the role."
  type        = string
}

variable "policy_statements" {
  description = "The statements to include in the IAM policy."
  type = list(object({
    Effect    = string
    Action    = list(string)
    Resource  = list(string)
    Condition = optional(any)
  }))
  default = []
}

variable "policy_description" {
  description = "A description for the IAM policy."
  type        = string
}

variable "path" {
  description = "The path for the role."
  type        = string
  default     = "/service-role/"
}

variable "max_session_duration" {
  description = "The maximum session duration for the role, in seconds."
  type        = number
  default     = 3600
}

variable "env_short" {
  description = "Short string for environment"
  type        = string
}

variable "managed_policies" {
  type        = list(string)
  default     = []
  description = "List of managed policy ARNs to attach to the resource"
}

variable "append_environment_to_role_name" {
  type        = bool
  description = "Append environment name to role name"
  default     = true
}
