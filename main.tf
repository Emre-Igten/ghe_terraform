module "add-organization-member" {
  source = "./modules/add-organization-member"

  username = "Emre-Igten"
  role     = "admin"
}

module "create-team" {
  source = "./modules/create-team"

  team_name        = "Developers"
  team_description = "Developers team"
  team_privacy     = "closed"

}
module "create-team2" {
  source = "./modules/create-team"

  team_name        = "Testers"
  team_description = "Testers team"
  team_privacy     = "closed"

}
module "create-team3" {
  source = "./modules/create-team"

  team_name        = "Admins"
  team_description = "Admins team"
  team_privacy     = "closed"

}


module "add-team-memberadmin" {
  source   = "./modules/add-team-member"
  team_id  = "admins"
  username = "Emre-Igten"
  role     = "maintainer"
}

module "add-team-membertester" {
  source   = "./modules/add-team-member"
  team_id  = "testers"
  username = "Emre-Igten"
  role     = "maintainer"
}

module "add-team-memberdeveloper" {
  source   = "./modules/add-team-member"
  team_id  = "developers"
  username = "Emre-Igten"
  role     = "maintainer"
}


module "add-team-repository-permissionsadmins" {
  source     = "./modules/add-team-repository-permissions"
  team_id    = "admins"
  repository = "bpPOC"
  permission = "admin"
}


module "add-team-repository-permissionsdevs" {
  source     = "./modules/add-team-repository-permissions"
  team_id    = "developers"
  repository = "bpPOC"
  permission = "maintain"
}



module "add-team-repository-permissionstesters" {
  source     = "./modules/add-team-repository-permissions"
  team_id    = "testers"
  repository = "bpPOC"
  permission = "pull"
}




module "add-branch-protection" {
  source = "./modules/add-branch-protection"

  repository                      = "bpPOC"
  branch                          = "main"
  enforce_admins                  = true
  require_conversation_resolution = true
  strict                          = true
  required_approving_review_count = 1
  require_code_owner_reviews      = true
  require_last_push_approval      = true
  dismiss_stale_reviews           = true

  dismissal_users = ["Emre-Igten"]
  dismissal_teams = ["admins"]
  dismissal_apps  = ["allowedApp"]

  # Bypass pull request permissions
  allowed_users = ["Emre-Igten"]
  allowed_teams = ["admins"]
  allowed_apps  = ["allowedApp"]
}



