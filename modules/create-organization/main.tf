

resource "github_enterprise_organization" "org" {
  
  enterprise_id = var.enterprise_id
  name          = var.name
  display_name  = var.display_name
  description   = var.description
  billing_email = var.billing_email
  admin_logins  = var.admin_logins
}