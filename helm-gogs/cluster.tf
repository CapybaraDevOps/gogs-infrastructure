module "network" {
  source = "./modules/network"
}

resource "google_container_cluster" "my_cluster" {
  name     = "gogs-cluster"
  location = "europe-west3"
  enable_autopilot         = true
  enable_l4_ilb_subsetting = true
  initial_node_count = 1
  network    = module.network.network_name
  subnetwork = module.network.subnetwork_name
  deletion_protection = false
}

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
}

resource "helm_release" "gogs-app" {
  name       = "gogs-app"
  repository = "https://olkabolkagoryashenko.github.io/gogs-chart/"
  chart      = "gogsapp"
  namespace = "gogs-app"
  version    = "0.1.0"
  depends_on = [ kubernetes_namespace.gogs-app ]
  timeout    = 900
}

