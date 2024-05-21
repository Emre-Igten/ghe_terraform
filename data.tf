data "github_enterprise" "enterprise" {
  slug = "delaware-emu"
}

data "github_repository" "appbuilding_backend" {
  full_name = "DLW-TEST-ENV/appbuilding-backend"
}

data "github_repository" "appbuilding_frontend" {
  full_name = "DLW-TEST-ENV/appbuilding-frontend"
}


data "github_repository" "main_repo" {
  full_name = "DLW-TEST-EMRE/ghe_terraform"
}