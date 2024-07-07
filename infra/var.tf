variable "service_account" {
  type = object({
    account_id   = string
    display_name = string
  })
}

variable "project_id" {
  type        = string
  description = "PROJECT ID"
}

variable "pool_id" {
  type        = string
  description = "Workload Identity Pool ID"
}

variable "pool_display_name" {
  type        = string
  description = "Display name for Workload Identity Pool"
}
variable "pool_description" {
  type        = string
  description = "Description of Workload Identity Pool"
}


variable "provider_id" {
  type        = string
  description = "Workload Identity Provider ID"
}
variable "provider_display_name" {
  type        = string
  description = "Display name of the Provider"
}

variable "provider_description" {
  type        = string
  description = "Description of the Provider"
  default     = "Workload Identity Pool Provider managed by Terraform"
}

/*
variable "attribute_condition" {
  description = "Workload Identity Pool Provider attribute condition expression"
  default     = "attribute.repository_owner==\"githubusername\""
}*/

variable "attribute_mapping" {
  type        = map(any)
  description = "Workload Identity Pool Provider attribute mapping"
  default = {
    "google.subject"  = "assertion.sub"
    "attribute.actor" = "assertion.actor"
    #"attribute.aud"              = "assertion.aud"
    "attribute.repository" = "assertion.repository"
    #"attribute.repository_owner" = "assertion.repository_owner"
  }
}


variable "allowed_audiences" {
  type        = list(string)
  description = "Workload Identity Pool Provider allowed audiences"
  default     = []
}

variable "repository_name" {
  type        = string
  description = "Name consists of the user and repository name"
}

