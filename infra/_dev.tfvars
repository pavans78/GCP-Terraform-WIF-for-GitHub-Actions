project_id = "acquired-storm-428614-i2"

pool_id           = "github-actions-cicd"
pool_display_name = "GitHub Actions CICD"
pool_description  = "Workload Identity Pool for GitHub Actions to deploy the infra using the Terraform"

provider_id           = "github-actions-provider"
provider_display_name = "GitHub Actions Provider"
provider_description  = "Workload Identity Pool Provider for Github Actions CICD"


service_account = {
  account_id   = "sa-github-actions-cicd"
  display_name = "Service Account for github actions"
}

repository_name = "pavans78/terraform-wif1"

