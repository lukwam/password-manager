resource "google_cloudbuild_trigger" "deploy_app_trigger" {
  provider       = google-beta
  name           = "deploy-app"
  description    = "Deploy App"
  filename       = "app/cloudbuild.yaml"
  project        = google_project.project.project_id

  included_files = [
    "app/**",
  ]

  ignored_files = [
    "app/*.md",
    "app/*.sh",
  ]

  github {
    name     = "password-manager"
    owner    = var.github_login
    push {
      branch = "^main"
    }
  }

  depends_on = [
    google_project_service.services["cloudbuild.googleapis.com"]
  ]
}
