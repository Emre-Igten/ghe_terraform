variable "require_signed_commits" {
    description = "Setting this to true requires all commits to be signed with GPG."
    type = bool
    default = false
  
}

variable "require_last_push_approval" {
    description = "Require that The most recent push must be approved by someone other than the last pusher. Defaults to false."
    type = bool
    default = false
  
}

# variable "allowed_merge_commit_types" {
#     description = "The list of merge commit types to allow. Defaults to all."
#     type = map(bool)
#     default = {
#       squash = true
#       merge  = true
#       rebase = true
#     }
  
# }

# variable "checks" {
#     description = "The list of status checks to require in order to merge into this branch."
#     type = list(string)
  
# }
variable "strict" {
    description = "Require branches to be up to date before merging. Defaults to false."
    type = bool
  
}

variable "required_approving_review_count" {
    description = "The number of reviewers required to approve pull requests. Defaults to 1."
    type = number
    default = 1
  
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





variable "require_code_owner_reviews" {
    description = "Require an approved review in pull requests including files with a designated code owner. Defaults to false."
    type = bool
    default = false
  
}

variable "allowed_users" {
    description = "The list of user logins with push access."
    type = list(string)
  
}

variable "allowed_teams" {
    description = "The list of team slugs with push access."
    type = list(string)
  
}

variable "allowed_apps" {
    description = "The list of app slugs with push access."
    type = list(string)
  
}

variable "dismissal_users" {
    description = "The list of user logins with push access."
    type = list(string)
  
}

variable "dismissal_teams" {
    description = "The list of team slugs with push access."
    type = list(string)
  
}

variable "dismissal_apps" {
    description = "The list of app slugs with push access."
    type = list(string)
  
}




  
