variable "principal_arns" {
  description = "ARNs of accounts, users, or roles who can assume this role"
  type        = "list"
}

variable "require_mfa" {
  description = "ARNs of accounts, users, or roles who can assume this role"
  type        = "string"
}
