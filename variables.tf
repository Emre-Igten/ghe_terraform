variable "admin_logins" {
  description = "The admin logins of the organization"
  type        = list(string)
  default = ["igtene_dlwr"]
}

variable "billing_email" {
  description = "The billing email of the organization"
  type        = string
  default = "joke.roelstraete@delaware.pro"
}




