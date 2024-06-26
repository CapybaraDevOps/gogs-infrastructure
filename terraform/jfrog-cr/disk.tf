resource "google_compute_disk" "disk_jfrog_jcr" {
  name        = "${var.region}-${var.app}-disk-jfrog-jcr"
  description = "Disk for Jfrog config"
  type        = "pd-ssd"
  size        = var.disk_size
  labels = {
    app = var.app
  }
}
