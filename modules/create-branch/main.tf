resource "github_branch" "development" {
  repository = var.repository
  branch     = var.branch
}