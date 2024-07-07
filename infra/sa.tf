resource "google_service_account" "service_account" {
  project      = var.project_id
  account_id   = var.service_account.account_id
  display_name = var.service_account.display_name
}

resource "google_service_account_iam_member" "wif-sa" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${google_service_account.service_account.email}"
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_actions.name}/attribute.repository/${var.repository_name}"
}