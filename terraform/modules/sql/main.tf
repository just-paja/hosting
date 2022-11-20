variable "region" { type = string }

resource "google_sql_database_instance" "california" {
  name             = "cerritos"
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}
