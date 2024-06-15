resource "kubernetes_namespace" "gogs-app" {
  metadata {
    annotations = {
      name = "gogs-app"
    }

    labels = {
      namespace = "gogs-app"
    }
    name = "gogs-app"
  }
  depends_on = [google_container_node_pool.gogs_node_pool]
  timeouts {
    delete = "1m"
  }
}