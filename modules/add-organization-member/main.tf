
resource "github_membership" "membership_for_some_user" {
  username = var.username
  role     = var.role
  downgrade_on_destroy = var.downgrade_on_destroy
}