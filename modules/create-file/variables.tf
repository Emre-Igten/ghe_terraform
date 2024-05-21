variable "repository" {
  description = "The name of the repository."
  type        = string
}

variable "branch" {
  description = "Git branch (defaults to the repository's default branch). The branch must already exist, it will not be created if it does not already exist."
  type        = string
}

variable "path_file" {
  description = "The path of the file to manage."
  type        = string
}

variable "content" {
  description = "The file content."
  type        = string
}

variable "commit_message" {
  description = "The commit message when creating, updating or deleting the managed file."
  type        = string
}

variable "overwrite_on_create" {
  description = "Enable overwriting existing files."
  type        = bool
  default     = false
}