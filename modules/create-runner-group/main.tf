resource "github_actions_runner_group" "example" {
  name                    = var.runner_name
  visibility              = var.visibility
  selected_repository_ids = var.selected_repository_ids
}