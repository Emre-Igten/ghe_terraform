variable "username" {
  description = "The user to add to the organization"
  type        = string
}

variable "role" {
  description = "The role of the user within the team. Must be one of member or maintainer. Defaults to member."
  type        = string
}

variable "team_id" {
  description = "The GitHub team id or the GitHub team slug"
  type = string 
}