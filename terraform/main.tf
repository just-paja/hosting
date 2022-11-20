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
  service = "iam.googleapis.com"
}

resource "google_project_service" "cloudsql" {
  service = "sqladmin.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
}

resource "google_project_service" "containerregistry" {
  service = "containerregistry.googleapis.com"
}

resource "google_project_service" "kubernetes" {
  service = "container.googleapis.com"
}
