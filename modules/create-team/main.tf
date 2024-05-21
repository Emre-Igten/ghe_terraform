resource "github_team" "example-team" {
  name        = var.team_name
  description = var.team_description
  privacy     = var.team_privacy
}

