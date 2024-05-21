
## create an organization using the module create-organization
module "create-organization" {
  source = "./modules/create-organization"

  enterprise_id  = data.github_enterprise.enterprise.id
  name           = "DLW-TEST-DEMO"
  display_name   = "DLW-TEST-DEMO"
  description    = "Development Environment"
  billing_email  = var.billing_email
  admin_logins   = var.admin_logins
}

## create teams
module "create-developers-team" {
  source = "./modules/create-team"
  
  team_name        = "Developers"
  team_description = "Responsible for actively developing features"
  team_privacy     = "closed"
}

module "create-testers-team" {
  source = "./modules/create-team"
  
  team_name        = "Testers"
  team_description = "Responsible for testing the developed features"
  team_privacy     = "closed"
}

module "create-admins-team" {
  source = "./modules/create-team"
  
  team_name        = "Admins"
  team_description = "Responsible for overall management of the development environment"
  team_privacy     = "closed"
}



## add members to teams
module "add-developer-to-team" {
  source = "./modules/add-team-member"
  
  team_id   = module.create-developers-team.team_id
  username  = "developer_username"
  role      = "member"
}

module "add-tester-to-team" {
  source = "./modules/add-team-member"
  
  team_id   = module.create-testers-team.team_id
  username  = "tester_username"
  role      = "member"
}

module "add-admin-to-team" {
  source = "./modules/add-team-member"
  
  team_id   = module.create-admins-team.team_id
  username  = "admin_username"
  role      = "member"
}

## create repositories
module "create-backend-repo" {
  source = "./modules/create-repository"
  
  repo_visibility          = "private"
  repo_name                = "appbuilding-backend"
  repo_description         = "Repository for the backend code of the app"
  repo_has_projects        = true
  repo_auto_init           = true
  repo_vulnerability_alerts = true
}

module "create-frontend-repo" {
  source = "./modules/create-repository"
  
  repo_visibility          = "private"
  repo_name                = "appbuilding-frontend"
  repo_description         = "Repository for the frontend code of the app"
  repo_has_projects        = true
  repo_auto_init           = true
  repo_vulnerability_alerts = true
}

## create branches
module "create-master-branch" {
  source     = "./modules/create-branch"
  repository = module.create-backend-repo.repo_name
  branch     = "master"
}

module "create-development-branch" {
  source     = "./modules/create-branch"
  repository = module.create-backend-repo.repo_name
  branch     = "development"
}

module "create-master-branch-frontend" {
  source     = "./modules/create-branch"
  repository = module.create-frontend-repo.repo_name
  branch     = "master"
}

module "create-development-branch-frontend" {
  source     = "./modules/create-branch"
  repository = module.create-frontend-repo.repo_name
  branch     = "development"
}

## assign teams to repositories
module "assign-developers-team" {
  source      = "./modules/add-team-repository-permissions"
  team_id     = module.create-developers-team.team_id
  repository  = module.create-backend-repo.repo_name
  permission  = "maintain"
}

module "assign-testers-team" {
  source      = "./modules/add-team-repository-permissions"
  team_id     = module.create-testers-team.team_id
  repository  = module.create-backend-repo.repo_name
  permission  = "pull"
}

module "assign-admins-team" {
  source      = "./modules/add-team-repository-permissions"
  team_id     = module.create-admins-team.team_id
  repository  = module.create-backend-repo.repo_name
  permission  = "admin"
}

module "assign-developers-team-frontend" {
  source      = "./modules/add-team-repository-permissions"
  team_id     = module.create-developers-team.team_id
  repository  = module.create-frontend-repo.repo_name
  permission  = "maintain"
}

module "assign-testers-team-frontend" {
  source      = "./modules/add-team-repository-permissions"
  team_id     = module.create-testers-team.team_id
  repository  = module.create-frontend-repo.repo_name
  permission  = "pull"
}

module "assign-admins-team-frontend" {
  source      = "./modules/add-team-repository-permissions"
  team_id     = module.create-admins-team.team_id
  repository  = module.create-frontend-repo.repo_name
  permission  = "admin"
}

## set up branch protections
module "add-branch-protection-backend" {
  source = "./modules/add-branch-protection"

  repository = module.create-backend-repo.repo_name
  branch = "master"
  enforce_admins = true

  required_signed_commits = true
  require_conversation_resolution = true

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

module "add-branch-protection-frontend" {
  source = "./modules/add-branch-protection"

  repository = module.create-frontend-repo.repo_name
  branch = "master"
  enforce_admins = true

  required_signed_commits = true
  require_conversation_resolution = true

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

## add organization members
module "add-developer-to-organization" {
  source = "./modules/add-organization-member"
  username = "igtene_dlwr"
  role     = "member"
}

module "add-tester-to-organization" {
  source = "./modules/add-organization-member"
  username = "igtene_dlwr"
  role     = "member"
}

module "add-admin-to-organization" {
  source = "./modules/add-organization-member"
  username = "igtene_dlwr"
  role     = "admin"
}

## create files
module "create-readme-backend" {
  source = "./modules/create-file"
  
  repository          = module.create-backend-repo.repo_name
  branch              = "development"
  path_file           = "README.md"
  content             = "This is the README file for the backend repository."
  commit_message      = "Create README file"
  overwrite_on_create = "false"
}

module "create-readme-frontend" {
  source = "./modules/create-file"
  
  repository          = module.create-frontend-repo.repo_name
  branch              = "development"
  path_file           = "README.md"
  content             = "This is the README file for the frontend repository."
  commit_message      = "Create README file"
  overwrite_on_create = "false"
}

## create repository projects
module "create-backend-project" {
  source = "./modules/create-repository-project"
  
  project_name = "Backend Project"
  repository   = module.create-backend-repo.repo_name
  body         = "This is the project for the backend repository."
  column_name  = "To Do"
  note         = "Add tasks here"
}

module "create-frontend-project" {
  source = "./modules/create-repository-project"
  
  project_name = "Frontend Project"
  repository   = module.create-frontend-repo.repo_name
  body         = "This is the project for the frontend repository."
  column_name  = "To Do"
  note         = "Add tasks here"
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












  



