

resource "github_repository_ruleset" "example" {
  name        = var.name
  repository  = var.repository
  target      = var.target
  enforcement = var.enforcement

  conditions {
    ref_name {
      include = var.include
      exclude = var.exclude
    }
  }

  bypass_actors {
    actor_id    = var.actor_id
    actor_type  = var.actor_type
    bypass_mode = var.bypass_mode
  }

  rules {
    branch_name_pattern {
      operator = var.operator
      pattern = var.pattern
      name = var.rulename
      negate = var.negate
    }


    creation                = var.creation
    update                  = var.update
    deletion                = var.deletion
    required_linear_history = var.required_linear_history
    required_signatures     = var.required_signatures

    


  }
}