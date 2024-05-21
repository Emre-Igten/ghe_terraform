module "create-organization" {
  source = "./modules/create-organization"

  enterprise_id  = data.github_enterprise.enterprise.id
  name           = "DLW-TEST-DEMO"
  display_name   = "DLW-TEST-DEMO"
  description    = "Organization made for the new APP"
  billing_email  = var.billing_email
  admin_logins   = var.admin_logins
}



module "create-repository-project" {
  source = "./modules/create-repository-project"
  
  project_name = "New Project"
  repository = "appbuilding-backend"
  body = "This is a new Organization Project"
  column_name = "Default Column"
  note = "Testing NOTES"
}

module "create-runner-group" {
  source = "./modules/create-runner-group"

  runner_name =  "Runner Group Test"
  visibility = "selected"
  selected_repository_ids = [data.github_repository.main_repo.repo_id, data.github_repository.appbuilding_backend.repo_id, data.github_repository.appbuilding_frontend.repo_id,]
}

module "add-repository-ruleset" {

  source = "./modules/add-repository-ruleset"
  
  name        = "Ruleset Test"
  repository  = "Test-Repo"
  target      = "branch"
  enforcement = "active"

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

module "add-repository-ruleset2" {

  source = "./modules/add-repository-ruleset"
  
  name        = "Ruleset Devs"
  repository  = "Dev-Repo"
  target      = "branch"
  enforcement = "active"

  include = ["~ALL"]
  exclude = []

  actor_id = 1
  actor_type = "OrganizationAdmin"
  bypass_mode = "always"

  operator = "starts_with"
  pattern = "match_this"
  rulename = "Rule Two"
  negate = true

  creation = true
  update = true
  deletion = true
  required_linear_history = true
  required_signatures = true

}




module "create-team" {
  source = "./modules/create-team"
  
  team_name        = "Admins"
  team_description = "This team is made with TERRAFORM"
  team_privacy     = "closed"
  
}

module "create-team2" {
  source = "./modules/create-team"
  
  team_name        = "Testers"
  team_description = "This team is made with TERRAFORM"
  team_privacy     = "closed"
  
}

module "create-team3" {
  source = "./modules/create-team"
  
  team_name        = "Developers"
  team_description = "This team is made with TERRAFORM"
  team_privacy     = "closed"
  
}

module "add-team-memberadmin" {
  source = "./modules/add-team-member"
  
  team_id = "admins"
  username = "igtene_dlwr"
  role     = "maintainer"
  
}

module "add-team-membertester" {
  source = "./modules/add-team-member"
  
  team_id = "testers"
  username = "igtene_dlwr"
  role     = "maintainer"
  
}

module "add-team-memberdeveloper" {
  source = "./modules/add-team-member"
  
  team_id = "developers"
  username = "igtene_dlwr"
  role     = "maintainer"
  
}

module "add-organization-member" {
  source = "./modules/add-organization-member"

  username = "igtene_dlwr"
  role = "admin"  
}

module "create-repository-backend" {
  source = "./modules/create-repository"
  
  repo_visibility          = "private"
  repo_name                = "appbuilding-backend"
  repo_description         = "Created with Terraform"
  repo_has_projects = true
  repo_auto_init           = true
  repo_vulnerability_alerts = true
}


module "create-repository-frontend" {
  source = "./modules/create-repository"
  
  repo_visibility          = "private"
  repo_name                = "appbuilding-frontend"
  repo_description         = "Created with Terraform"
  repo_has_projects = true
  repo_auto_init           = true
  repo_vulnerability_alerts = true
}


module "create-filefrontend" {
  source = "./modules/create-file"
  
  repository          = "appbuilding-frontend"
  branch              = "development"
  path_file           = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  overwrite_on_create = "false"
  
}

module "create-filebackend" {
  source = "./modules/create-file"
  

  repository          = "appbuilding-backend"
  branch              = "development"
  path_file           = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  overwrite_on_create = "false"

}
module "create-branchfrontend" {
  source = "./modules/create-branch"

  repository = "appbuilding-frontend"
  branch     = "development"


}

module "create-branchfrontend2" {
  source = "./modules/create-branch"

  repository = "appbuilding-frontend"
  branch     = "master"


}

module "create-branchbackend2" {
  source = "./modules/create-branch"

  repository = "appbuilding-backend"
  branch     = "development"


}

module "create-branchbackend" {
  source = "./modules/create-branch"

  repository = "appbuilding-backend"
  branch     = "master"


}

module "add-branch-protectionfrontend" {
  source = "./modules/add-branch-protection"


  repository = "appbuilding-frontend"
  branch = "master"
  enforce_admins = true

  required_signed_commits = false
  require_conversation_resolution = false

# Dismissal of stale reviews permissions
  strict = true
  dismiss_stale_reviews = true
  dismissal_users = ["igtene_dlwr"]
  dismissal_teams = ["admins"]
  dismissal_apps = ["allowedApp"]

# bypass pull request permissions
  allowed_users = ["igtene_dlwr"]
  allowed_teams = ["admins"]
  allowed_apps = ["allowedApp"]




}

module "add-branch-protectionbackend" {
  source = "./modules/add-branch-protection"

  # if the repository has not been made yet use this value and comment the other
  # repository          = module.create-repository.repository_name
  repository = "appbuilding-backend"
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

# bypass pull request permissions
  allowed_users = ["igtene_dlwr"]
  allowed_teams = ["admins"]
  allowed_apps = ["allowedApp"]

}




module "add-team-repository-permissionsadmins" {
  source = "./modules/add-team-repository-permissions"

  team_id = "admins"
  repository = "appbuilding-backend"
  permission = "admin"
  
}

module "add-team-repository-permissionsadmins2" {
  source = "./modules/add-team-repository-permissions"

  team_id = "admins"
  repository = "appbuilding-frontend"
  permission = "admin"
  
}

module "add-team-repository-permissionsdevs" {
  source = "./modules/add-team-repository-permissions"

  team_id = "developers"
  repository = "appbuilding-frontend"
  permission = "maintain"
  
}

module "add-team-repository-permissionsdevs2" {
  source = "./modules/add-team-repository-permissions"

  team_id = "developers"
  repository = "appbuilding-backend"
  permission = "maintain"
  
}

module "add-team-repository-permissionstesters" {
  source = "./modules/add-team-repository-permissions"

  team_id = "testers"
  repository = "appbuilding-backend"
  permission = "pull"
  
}

module "add-team-repository-permissionstesters2" {
  source = "./modules/add-team-repository-permissions"

  team_id = "testers"
  repository = "appbuilding-frontend"
  permission = "pull"
  
}
