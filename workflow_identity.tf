resource "google_iam_workload_identity_pool" "github_autm_pool" {
  workload_identity_pool_id = "github-test-autm-pool"
  display_name              = "github-test-autm-pool"
  description               = "Workload ID pool for Github Actions"
}

resource "google_iam_workload_identity_pool_provider" "github_autm_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_autm_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-test-autm-provider"
  display_name                       = "github-test-autm-provider"
  attribute_mapping = {
    "google.subject"       = "assertion.sub",
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account" "autm_github_sa" {
  account_id   = "autm-github-test-sa"
  display_name = "automation Github Action Service account"
}

resource "google_service_account_iam_member" "workload_binding_github_automation" {
  service_account_id = google_service_account.autm_github_sa.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github_autm_pool.workload_identity_pool_id}/attribute.repository/munir505/backstage-test"
}
