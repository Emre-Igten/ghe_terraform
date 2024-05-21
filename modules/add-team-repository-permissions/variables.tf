variable "repository" {
  description = "The name of the repository."
  type        = string
}

variable "permission" {
  description = "The permissions of team members regarding the repository. Must be one of pull, triage, push, maintain, admin or the name of an existing custom repository role within the organisation. Defaults to pull."
  type        = string
}


variable "team_id" {
  description = "The GitHub team id or the GitHub team slug"
  type = string
}