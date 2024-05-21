variable "strict" {
    description = "Require branches to be up to date before merging. Defaults to false."
    type = bool
  
}

variable "repository" {
    description = "The GitHub repository name."
    type = string
  
}

variable "enforce_admins" {
    description = "Setting this to true enforces status checks for repository administrators."
    type = bool
  
}


variable "branch" {
    description = "The Git branch to protect."
    type = string
  
}

variable "required_signed_commits" {
    description = "Setting this to true requires all commits to be signed with GPG."
    type = bool
    default = false
  
}



variable "require_conversation_resolution" {
    description = "Setting this to true requires all conversations on code must be resolved before a pull request can be merged."
    type = bool
    default = false
  
}

variable "dismiss_stale_reviews" {
    description = "Dismiss approved reviews automatically when a new commit is pushed. Defaults to false."
    type = bool
    default = false
  
}

variable "dismissal_users" {
  description = "The list of user logins with dismissal access"
  type        = list(string)
}


variable "dismissal_teams" {
  description = "The list of team slugs with dismissal access. Always use slug of the team, not its name. Each team already has to have access to the repository."
  type        = list(string)
}

variable "dismissal_apps" {
  description = "The list of app slugs with dismissal access."
  type        = list(string)
}


variable "allowed_users" {
  description = "The list of user logins allowed to bypass pull request requirements."
  type        = list(string)
}


variable "allowed_teams" {
  description = "The list of team slugs allowed to bypass pull request requirements."
  type        = list(string)
}

variable "allowed_apps" {
  description = "The list of app slugs allowed to bypass pull request requirements."
  type        = list(string)
}


variable "require_code_owner_reviews" {
    description = "Require an approved review in pull requests including files with a designated code owner. Defaults to false."
    type = bool
    default = false
  
}

# variable "restricted_users" {
#   description = "The list of user logins with push access."
#   type        = list(string)
# }


# variable "restricted_teams" {
#   description = "The list of team slugs with push access."
#   type        = list(string)
# }

# variable "restricted_apps" {
#   description = "The list of app slugs with push access."
#   type        = list(string)
# }


  
