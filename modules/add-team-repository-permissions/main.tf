resource "github_team_repository" "some_team_repo" {
  team_id    = var.team_id
  repository = var.repository
  permission = var.permission
}