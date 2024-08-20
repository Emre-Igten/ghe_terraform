module "add-organization-member" {
  source = "./modules/add-organization-member"

  username = "Emre-Igten"
  role     = "admin"

}

module "create-team" {
  source = "./modules/create-team"

  name        = "Developers"
  description = "Developers team"
  privacy     = "closed"

}
module "create-team2" {
  source = "./modules/create-team"

  name        = "Testers"
  description = "Testers team"
  privacy     = "closed"

}
module "create-team3" {
  source = "./modules/create-team"

  name        = "Admins"
  description = "Admins team"
  privacy     = "closed"

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

  dismissal_users       = ["igtene_dlwr"]
  dismissal_teams       = ["admins"]
  dismissal_apps        = ["allowedApp"]

  # Bypass pull request permissions
  allowed_users = ["igtene_dlwr"]
  allowed_teams = ["admins"]
  allowed_apps  = ["allowedApp"]
}



