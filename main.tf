module "add-branch-protection" {
  source = "./modules/add-branch-protection"

  repository = "bpPOC"
  branch = "main"
  enforce_admins = true
  require_conversation_resolution = true
  strict = true
  required_approving_review_count = 1
  require_code_owner_reviews = true
  require_last_push_approval =true
  dismiss_stale_reviews = true

  
}