variable "role_name" {
  description = "Name for the role being created"
  type        = string
}

variable "principal_arns" {
  description = "ARNs of accounts, users, or roles who can assume this role"
  type        = list(string)
}

variable "policy_arns" {
  description = "ARNs for policies attached to this role"
  type        = list(string)
}

variable "max_session_duration" {
  description = "Max session duration for iam role"
  type        = string
  default     = 3600
}


variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "require_mfa" {
  description = "Boolean to determine whether the role should require users assuming it to have MFA enabled"
  type        = bool
  default     = false
}