resource "github_repository_file" "foo" {
  repository          = var.repository
  branch              = var.branch
  file                = var.path_file
  content             = var.content
  commit_message      = var.commit_message
  overwrite_on_create = var.overwrite_on_create
}