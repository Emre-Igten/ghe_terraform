resource "github_team_membership" "some_team_membership" {
  team_id  = var.team_id
  username = var.username
  role     = var.role
}