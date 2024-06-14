terraform {
  backend "gcs" {
  }
  required_version = "= 1.8.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.31.0"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "~>4"
    }
  }
}
data "google_client_config" "provider" {}

provider "kubernetes" {
  host  = "https://${google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
}
provider "helm" {
  kubernetes {
    token                  = data.google_client_config.provider.access_token
    host                   = "https://${google_container_cluster.my_cluster.endpoint}"
    cluster_ca_certificate = base64decode(google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project
  region  = var.region
  zone    = var.zone
}
