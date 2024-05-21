variable "runner_name" {
  description = "Name of the runner group"
  type = string
}

variable "visibility" {
    description = "Visibility of a runner group. Whether the runner group can include all, selected, or private repositories. A value of private is not currently supported due to limitations in the GitHub API."
    type = string
}

variable "selected_repository_ids" {
    description = "IDs of the repositories which should be added to the runner group"
    type = list(number)
  
}

