


variable "repo_name" {
  description = "The name of the repository"
  type        = string
}

variable "repo_description" {
  description = "The description of the repository"
  type        = string
  default     = ""
}

variable "repo_visibility" {
  description = "The visibility of the repository"
  type        = string
  default     = "internal" 
}

variable "repo_has_issues" {
  description = "Specifies if the repository has issues enabled"
  type        = bool
  default     = true
}

variable "repo_has_projects" {
  description = "Specifies if the repository has projects enabled"
  type        = bool
  default     = true
}

variable "repo_has_wiki" {
  description = "Specifies if the repository has wiki enabled"
  type        = bool
  default     = true
}

variable "repo_has_downloads" {
  description = "Specifies if the repository has downloads enabled"
  type        = bool
  default     = true
}

variable "repo_archived" {
  description = "Specifies if the repository is archived"
  type        = bool
  default     = false
}

variable "repo_allow_rebase_merge" {
  description = "Specifies if rebase merges are allowed for the repository"
  type        = bool
  default     = true
}

variable "repo_allow_squash_merge" {
  description = "Specifies if squash merges are allowed for the repository"
  type        = bool
  default     = true
}

variable "repo_allow_merge_commit" {
  description = "Specifies if merge commits are allowed for the repository"
  type        = bool
  default     = true
}

variable "repo_auto_init" {
  description = "Specifies if the repository is automatically initialized upon creation"
  type        = bool
  default     = false
}

variable "repo_gitignore_template" {
  description = "Specifies the gitignore template for the repository"
  type        = string
  default     = null
}

variable "repo_license_template" {
  description = "Specifies the license template for the repository"
  type        = string
  default     = null
}

variable "repo_topics" {
  description = "Specifies the topics for the repository"
  type        = list(string)
  default     = []
}

variable "repo_vulnerability_alerts" {
  description = "Specifies if vulnerability alerts are enabled for the repository"
  type        = bool
  default     = false
}

variable "repo_is_template" {
  description = "Specifies if the repository is a template repository"
  type        = bool
  default     = false
}




