resource "google_project_service" "cloudresourcemanager" {
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "iam" {
  depends_on = [google_project_service.cloudresourcemanager]
  service    = "iam.googleapis.com"
}

resource "google_project_service" "cloudsql" {
  depends_on = [google_project_service.cloudresourcemanager]
  service    = "sqladmin.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
  depends_on = [google_project_service.cloudresourcemanager]
  service    = "cloudbuild.googleapis.com"
}

resource "google_project_service" "containerregistry" {
  depends_on = [google_project_service.cloudresourcemanager]
  service    = "containerregistry.googleapis.com"
}

resource "google_project_service" "kubernetes" {
  depends_on = [google_project_service.cloudresourcemanager]
  service    = "container.googleapis.com"
}
