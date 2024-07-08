resource "random_password" "gogs_password" {
  length  = 16
  special = true
}

resource "google_secret_manager_secret" "gogs_credentials" {
  secret_id = "${var.env}-gogs-credentials"
  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "gogs_password_version" {
  secret      = google_secret_manager_secret.gogs_credentials.id
  secret_data = random_password.gogs_password.result
}

resource "kubernetes_secret" "gogs_admin_password" {
  metadata {
    name      = "${var.env}-gogs-admin-password"
    namespace = kubernetes_namespace.gogs-app.metadata[0].name
  }

  data = {
    password = google_secret_manager_secret_version.gogs_password_version.secret_data
  }
}

data "google_secret_manager_secret_version" "tls_cert" {
  secret = "${var.env}-gogs-cert"  
  version = "latest"
}

data "google_secret_manager_secret_version" "tls_key" {
  secret = "${var.env}-gogs-key"  
  version = "latest"
}

resource "kubernetes_secret" "gogs_https_cert_key" {
  metadata {
    name = "${var.env}-gogs-tls"
    namespace = kubernetes_namespace.gogs-app.metadata[0].name
  }

  data = {
    "tls.crt" = base64encode(data.google_secret_manager_secret_version.tls_cert.secret_data)
    "tls.key" = base64encode(data.google_secret_manager_secret_version.tls_key.secret_data)
  }

  type = "kubernetes.io/tls"
}

resource "google_compute_managed_ssl_certificate" "managed_ssl_cert" {
  name = "dev-01-gogs-tls-01"

  managed {
    domains = ["${var.env}.capybara.pp.ua."]
  }
}