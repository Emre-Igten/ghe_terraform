output "organization_name" {
  description = "Name of the created GitHub organization"
  value       = module.create-organization.organization_name
}


output "secret_value" {
  value = data.github_actions_secret.admin_token.value
}