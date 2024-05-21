variable "name" {
  description = "The name of the ruleset."
  type        = string
}

variable "repository" {
  description = "The name of the repository."
  type        = string
}

variable "target" {
  description = " Possible values are branch and tag."
  type        = string
}

variable "enforcement" {
  description = "Possible values for Enforcement are disabled, active, evaluate. Note: evaluate is currently only supported for owners of type organization."
  type        = string
}

variable "include" {
  description = " Array of ref names or patterns to include. One of these patterns must match for the condition to pass. Also accepts ~DEFAULT_BRANCH to include the default branch or ~ALL to include all branches."
  type        = list(string)
}

variable "exclude" {
  description = "Array of ref names or patterns to exclude. The condition will not pass if any of these patterns match."
  type        = list(string)
  default = []
}

variable "actor_id" {
  description = "The ID of the actor that can bypass a ruleset."
  type = number
}

variable "actor_type" {
    description = " The type of actor that can bypass a ruleset. Can be one of: RepositoryRole, Team, Integration, OrganizationAdmin."
    type = string 
}

variable "bypass_mode" {
    description = "When the specified actor can bypass the ruleset. pull_request means that an actor can only bypass rules on pull requests. Can be one of: always, pull_request."
    type = string
}

variable "operator" {
  description = "The operator to use for matching. Can be one of: starts_with, ends_with, contains, regex."
  type = string
}

variable "pattern" {
  description = "The pattern to match with."
  type = string
}

variable "rulename" {
  description = "How this rule will appear to users."
  type = string
}

variable "negate" {
  description = "If true, the rule will fail if the pattern matches."
  type = bool
  
}

variable "creation" {
  description = "Only alow users with bypass permission to delete matching refs."
  type = bool
}

variable "update" {
  description = "Only allow users with bypass permission to update matching refs."
  type = bool 
}

variable "deletion" {
  description = "Only allow users with bypass permission to delete matching refs."
  type = bool
}

variable "required_linear_history" {
  description = "Prevent merge commits from being pushed to matching branches"
  type = bool
}

variable "required_signatures" {
  description = "Commits pushed to matching branches must have verified signatures."
  type = bool
  
}

