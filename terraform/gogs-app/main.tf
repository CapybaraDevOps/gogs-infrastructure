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
      source  = "hashicorp/google-beta"
      version = "~>4"
    }
  }
}
