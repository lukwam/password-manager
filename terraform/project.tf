resource "google_project" "project" {
  name            = var.project_name
  project_id      = var.project_id
  folder_id       = var.folder_id
  billing_account = data.google_billing_account.default.id

  labels = {
      billing     = lower(data.google_billing_account.default.id),
      repo        = var.repo,
  }

  auto_create_network = false
  skip_delete = false
}

resource "google_project_service" "services" {
  for_each = toset([
    "appengine.googleapis.com",
    "cloudbuild.googleapis.com",
    "iap.googleapis.com",
    "secretmanager.googleapis.com",
  ])
  service                    = each.key
  disable_dependent_services = true
  disable_on_destroy         = true
  project                    = google_project.project.project_id
}
