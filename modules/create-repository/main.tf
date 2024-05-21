resource "github_repository" "repo" {
  name          = var.repo_name
  description   = var.repo_description

  visibility    = var.repo_visibility

  has_issues    = var.repo_has_issues
  has_projects  = var.repo_has_projects
  has_wiki      = var.repo_has_wiki

  has_downloads = var.repo_has_downloads
  archived      = var.repo_archived
  allow_rebase_merge = var.repo_allow_rebase_merge
  allow_squash_merge = var.repo_allow_squash_merge
  allow_merge_commit = var.repo_allow_merge_commit
  auto_init     = var.repo_auto_init
  gitignore_template = var.repo_gitignore_template
  license_template   = var.repo_license_template
  topics        = var.repo_topics
  vulnerability_alerts = var.repo_vulnerability_alerts
  is_template   = var.repo_is_template
}

