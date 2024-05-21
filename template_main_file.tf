
## This file contains 1 of each module so you can run the use case through github copilot and easily complete it.
## Just copy this into the main.tf file and give copilot the use case asking for it to be completed using the modules provided.

## create an organization using the module create-organization
module "create-organization" {
  source = "./modules/create-organization"

  enterprise_id  = data.github_enterprise.enterprise.id
  name           = "name"
  display_name   = "name"
  description    = "description"
  billing_email  = var.billing_email
  admin_logins   = var.admin_logins
}



## add a member using the module add-organization-member
module "add-organization-member" {
  source   = "./modules/add-organization-member"
  username = "username"
  # role can be admin or member
  role     = "role"
}


## create a repository using the module create-repository
module "create-repository" {
  source = "./modules/create-repository"
  
  # visibilty can be public or private (or internal)
  repo_visibility          = "repo visibility"
  repo_name                = "repo name"
  repo_description         = "repo description"
  repo_has_projects        = true
  repo_auto_init           = true
  repo_vulnerability_alerts = true
}

## create a branch using the module create-branch
module "create-branch" {
  source     = "./modules/create-branch"
  repository = "repo name"
  branch     = "branch name"
}


## create a team using the module create-team
module "create-team" {
  source = "./modules/create-team"
  
  team_name        = "team name"
  team_description = "team description"
  # privacy can be secret or closed
  team_privacy     = "team privacy"
}



## add a member to the team using the module add-team-member
module "add-team-member" {
  source = "./modules/add-team-member"
  # team_id is the slug of the team
  team_id = "team id"
  username = "username"
  # role can be member or maintainer
  role     = "role"
}


## give permissions to teams on certain repositories using the module add-team-repository-permissions
module "add-team-repository-permissions" {
  source      = "./modules/add-team-repository-permissions"
  # team_id is the slug of the team
  team_id     = "team id"
  repository  = "repo name"
  ## permissions are admin, maintain or pull
  permission  = "permission"
}

## create a file in a repository using the module create-file
module "create-file" {
  source = "./modules/create-file"
  
  repository          = "repo name"
  branch              = "branch"
  path_file           = "file/path.txt"
  content             = "This is the content of the file."
  commit_message      = "Create new file"
  overwrite_on_create = "false"
}


## add protections to a branch using the module add-branch-protection
module "add-branch-protection" {
  source = "./modules/add-branch-protection"

  repository = "repo name"
  branch = "branch"
  enforce_admins = true

  required_signed_commits = false
  require_conversation_resolution = false

  # Dismissal of stale reviews permissions
  strict = true
  dismiss_stale_reviews = true
  dismissal_users = ["igtene_dlwr"]
  dismissal_teams = ["admins"]
  dismissal_apps = ["allowedApp"]

  # Bypass pull request permissions
  allowed_users = ["igtene_dlwr"]
  allowed_teams = ["admins"]
  allowed_apps = ["allowedApp"]
}
  


## add a ruleset to a repository using the module add-repository-ruleset
module "add-repository-ruleset" {
  source = "./modules/add-repository-ruleset"
  
  name        = "ruleset name"
  repository  = "repo name"
  target      = "target"
  enforcement = "enforcement"

  include = ["~ALL"]
  exclude = []

  actor_id = 1
  actor_type = "OrganizationAdmin"
  bypass_mode = "always"

  operator = "starts_with"
  pattern = "match_this"
  rulename = "Rule One"
  negate = true

  creation = true
  update = true
  deletion = true
  required_linear_history = true
  required_signatures = true
}



## create a runner group using the module create-runner-group
module "create-runner-group" {
  source = "./modules/create-runner-group"

  runner_name =  "Runner group name"
  visibility = "visibilty"
  selected_repository_ids = [data.github_repository.main_repo.repo_id, data.github_repository.appbuilding_backend.repo_id, data.github_repository.appbuilding_frontend.repo_id]
}



## create a project in a repository using the module create-repository-project
module "create-repository-project" {
  source = "./modules/create-repository-project"
  
  project_name = "project name"
  repository = "repo name"
  body = "project body"
  column_name = "column name"
  note = "notes"
}




############################












  



