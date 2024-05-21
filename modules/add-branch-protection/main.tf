
resource "github_branch_protection_v3" "example" {
  repository     = var.repository
  branch         = var.branch
  enforce_admins = var.enforce_admins
  
  require_signed_commits = var.required_signed_commits
  require_conversation_resolution = var.require_conversation_resolution
  
  required_status_checks {
    strict   = var.strict
    checks = [
      "ci/check:824642007264"
    ]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = var.dismiss_stale_reviews
    dismissal_users = var.dismissal_users
    dismissal_teams = var.dismissal_teams
    dismissal_apps = var.dismissal_apps

    require_code_owner_reviews = var.require_code_owner_reviews

    bypass_pull_request_allowances {
      users = var.allowed_users
      teams = var.allowed_teams
      apps = var.allowed_apps
    }
  }

  # restrictions {
  #   users = var.restricted_users
  #   teams = var.restricted_teams
  #   apps = var.restricted_apps
  # }

}

  
