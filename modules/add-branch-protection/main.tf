
resource "github_branch_protection_v3" "example" {
  repository     = var.repository
  branch         = var.branch
  enforce_admins = var.enforce_admins

  require_signed_commits          = var.required_signed_commits
  require_conversation_resolution = var.require_conversation_resolution

  required_status_checks { ## 5de en 6de policy op Azure DevOps
    strict = var.strict
    # checks = var.checks
  }

  required_pull_request_reviews {                                         ## 1ste,3de en 4de policy op Azure DevOps
    dismiss_stale_reviews           = var.dismiss_stale_reviews           ## sub 
    required_approving_review_count = var.required_approving_review_count ## sub
    require_code_owner_reviews      = var.require_code_owner_reviews      ## sub
    require_last_push_approval      = var.require_last_push_approval      ## sub

    bypass_pull_request_allowances {
      users = var.allowed_users
      teams = var.allowed_teams
      apps  = var.allowed_apps
    }


  }

  restrictions {
    users = var.dismissal_users
    teams = var.dismissal_teams
    apps  = var.dismissal_apps
  }


}


