project_id = "project-id"

pool_id           = "github-actions-cicd1"
pool_display_name = "GitHub Actions CICD"
pool_description  = "Workload Identity Pool for GitHub Actions to deploy the infra using the Terraform"

provider_id           = "github-actions-provider1"
provider_display_name = "GitHub Actions Provider"
provider_description  = "Workload Identity Pool Provider for Github Actions CICD"


service_account = {
  account_id   = "sa-github-actions-cicd1"
  display_name = "Service Account for github actions"
}

repository_name = "github-username/repo-name"

