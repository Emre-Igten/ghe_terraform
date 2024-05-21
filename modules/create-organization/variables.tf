variable "name" {
  description = "The name of the organization"
  type        = string
}

variable "display_name" {
  description = "The display name of the organization"
  type        = string
}

variable "description" {
  description = "The description of the organization"
  type        = string
}

variable "billing_email" {
  description = "The billing email of the organization"
  type        = string
  default = "joke.roelstraete@delaware.pro"
}

variable "admin_logins" {
  description = "The admin logins of the organization"
  type        = list(string)
  default = ["igtene_dlwr"]
}

variable "enterprise_id" {
  description = "The ID of the Enterprise"
  type = string
  
}

