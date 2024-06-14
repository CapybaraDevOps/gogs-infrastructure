resource "google_compute_network" "gogs-network" {
  name = "gogs-network"
  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = true
}
resource "google_compute_subnetwork" "gogs-subnetwork" {
  name = "example-subnetwork"
  ip_cidr_range = "10.0.0.0/16"
  region        = "europe-west3"
  private_ip_google_access = true
  network = google_compute_network.gogs-network.id
}

