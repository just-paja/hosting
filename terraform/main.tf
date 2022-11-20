variable "GCP_CREDENTIALS" { type = string }
variable "GCP_PROJECT" { type = string }

variable "GCP_REGION" {
  type    = string
  default = "europe-west1"
}

terraform {
  backend "gcs" {
    prefix = "hosting"
  }
}

provider "google" {
  project     = var.GCP_PROJECT
  region      = var.GCP_REGION
  credentials = var.GCP_CREDENTIALS
}

resource "google_project_service" "cloudresource" {
  service = "cloudresource.googleapis.com"
}

resource "google_project_service" "iam" {
  depends_on = [google_project_service.cloudresource]
  service    = "iam.googleapis.com"
}

resource "google_project_service" "cloudsql" {
  depends_on = [google_project_service.cloudresource]
  service    = "sqladmin.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
  depends_on = [google_project_service.cloudresource]
  service    = "cloudbuild.googleapis.com"
}

resource "google_project_service" "containerregistry" {
  depends_on = [google_project_service.cloudresource]
  service    = "containerregistry.googleapis.com"
}

resource "google_project_service" "kubernetes" {
  depends_on = [google_project_service.cloudresource]
  service    = "container.googleapis.com"
}
