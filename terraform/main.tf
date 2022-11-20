variable "GCP_CREDENTIALS" { type = string }
variable "GCP_PROJECT" { type = string }

variable "GCP_REGION" {
  type    = string
  default = "europe-west1"
}

locals {
  zone = "${var.GCP_REGION}a"
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

module "services" {
  source = "./modules/services"
}

module "sql" {
  depends_on = [module.services]
  source     = "./modules/sql"
  region     = var.GCP_REGION
}

module "kubernetes" {
  depends_on = [module.services, module.sql]
  source     = "./modules/kubernetes"
  location   = local.zone
}
