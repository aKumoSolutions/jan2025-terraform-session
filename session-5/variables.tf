variable "env" {
  description = "Environmnet"
  type        = string
  default     = "dev"
}
variable "provider_name" {
  description = "Provider"
  type        = string
  default     = "aws"
}
variable "business_unit" {
  description = "Business Unit"
  type        = string
  default     = "orders"
}

variable "region" {
  description = "Provider Region Name"
  type        = string
  default     = "usw2"
}

variable "project" {
  description = "Project Name"
  type        = string
  default     = "tom"
}

variable "tier" {
  description = "Application tier"
  type        = string
  default     = "db"
}
variable "team" {
  description = "Team Name"
  type        = string
  default     = "devops"
}
variable "owner" {
  description = "Resource Owner"
  type        = string
  default     = "kris"
}
variable "managed_by" {
  description = "Tool"
  type        = string
  default     = "terraform"
}
