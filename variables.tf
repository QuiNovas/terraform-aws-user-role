variable "allowed_user_arns" {
  description = "The list of IAM user ARNs that can assum this role. They must be using MFA."
  type        = list(string)
}

variable "allowed_user_names" {
  default     = []
  description = "The list of local user names that will be given acces to the role via a group of the same name."
  type        = list(string)
}

variable "name" {
  description = "The name of the role."
  type        = string
}

variable "policy_arns" {
  description = "The list of policy arns to attach to the role."
  type        = list(string)
}

variable "policy_arn_count" {
  description = "The number of policy arns to attach to the role."
  type        = number
}