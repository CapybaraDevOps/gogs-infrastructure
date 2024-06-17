resource "helm_release" "gogs-app" {
  name       = "gogs-app"
  repository = var.helm_repo
  chart      = "gogsapp"
  namespace  = "gogs-app"
  depends_on = [kubernetes_namespace.gogs-app]
  timeout    = 900
  repository_username = var.jfrog_username
  repository_password = var.jfrog_password

  set {
    name = "image.registry"
    value = "docker.io"
  }

  set {
    name = "image.repository"
    value = "gogs/gogs"
  }

  set_list {
    name = "service.env"
    value = [
      {"name" = "MYSQL_DATABASE", "value" = var.mysql_db_name},
      {"name" = "MYSQL_USER", "value" = var.mysql_username},
      {"name" = "MYSQL_ROOT_PASSWORD", "value" = kubernetes_secret.gogs_admin_password.data.password},
      {"name" = "MYSQL_PASSWORD", "value" = kubernetes_secret.gogs_admin_password.data.password}
    ]
  }

  set {
    name = "mysql.auth.username"
    value = "${var.mysql_username}"
  }
  set {
    name = "mysql.auth.password"
    value = "${kubernetes_secret.gogs_admin_password.data.password}"
  }
  set {
    name = "mysql.auth.database"
    value = "${var.mysql_db_name}"
  }
}