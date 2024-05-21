variable "username" {
  description = "The user to add to the organization"
  type        = string
}

variable "role" {
  description = "The role of the user within the organization. Must be one of member or admin. Defaults to member. admin role represents the owner role available via GitHub UI."
  type        = string
}

variable "downgrade_on_destroy" {
  description = "Defaults to false. If set to true, when this resource is destroyed, the member will not be removed from the organization. Instead, the member's role will be downgraded to 'member'."
  type        = bool
  default = false
}