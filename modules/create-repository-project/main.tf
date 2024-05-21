resource "github_repository_project" "project" {
  name = var.project_name
  repository = var.repository
  body = var.body
}


resource "github_project_column" "column" {
  project_id = github_repository_project.project.id
  name       = var.column_name
}

resource "github_project_card" "card" {
  column_id = github_project_column.column.column_id
  note        = var.note
}



