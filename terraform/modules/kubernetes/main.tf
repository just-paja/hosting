variable "location" { type = string }

resource "google_container_cluster" "starbase_001" {
  name = "starbase-001"
  location = var.location
  remove_default_node_pool = true
  initial_node_count = 1
}

resource "google_container_node_pool" "constellation" {
  name = "constellation"
  location = var.location
  cluster = google_container_cluster.starbase_001.id
  node_count = 1

  node_config { 
    machine_type = "f1-micro"
    disk_size_gb = 16
    disk_type = "pd-balanced"
  }
}
