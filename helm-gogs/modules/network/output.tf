output network_name {
  value = google_compute_network.gogs-network.name
}
output subnetwork_name {
  value = google_compute_subnetwork.gogs-subnetwork.name
}
output network_address {
  value = google_compute_network.gogs-network.id
}
output subnetwork_address {
  value = google_compute_subnetwork.gogs-subnetwork.self_link
}
