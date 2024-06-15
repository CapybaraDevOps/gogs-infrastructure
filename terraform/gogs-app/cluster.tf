resource "google_container_cluster" "gogs_cluster" {
  name                     = "${var.env}-${var.region}-gogs-cluster"
  location                 = var.zone
  enable_l4_ilb_subsetting = true
  initial_node_count       = 1
  network                  = module.network.network_name
  subnetwork               = module.network.subnetwork_name
  deletion_protection      = false
  remove_default_node_pool = true
}

resource "google_container_node_pool" "gogs_node_pool" {
  name       = "${var.env}-${var.region}-gogs-node-pool"
  cluster    = google_container_cluster.gogs_cluster.id
  location   = google_container_cluster.gogs_cluster.location
  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }
  node_config {
    preemptible  = true
    machine_type = var.machine_type
    disk_size_gb = 10

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

