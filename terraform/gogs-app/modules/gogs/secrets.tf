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

locals {
  tls_cert = file("certificate.crt")
  tls_key  = file("private.key")
}

resource "kubernetes_secret" "gogs_https_cert_key" {
  metadata {
    name = "${var.env}-gogs-tls"
    namespace = kubernetes_namespace.gogs-app.metadata[0].name  # 
  }

  data = {
    "tls.crt" = base64encode(local.tls_cert)
    "tls.key" = base64encode(local.tls_key)
  }

  type = "kubernetes.io/tls"
}