resource "helm_release" "gogs-app" {
  name       = "gogs-app"
  repository = var.helm_repo
  chart      = "gogsapp"
  namespace  = kubernetes_namespace.gogs-app.metadata[0].name
  depends_on = [kubernetes_namespace.gogs-app]
  timeout    = 600
  repository_username = var.jfrog_username
  repository_password = var.jfrog_password

  set {
    name = "service.ports[0].name"
    value = "http"
  }
  set {
    name = "service.ports[0].port"
    value = 80
  }
  set {
    name = "service.ports[0].targetPort"
    value = 3000
  }
  set {
    name = "service.ports[1].name"
    value = "https"
  }
  set {
    name = "service.ports[1].port"
    value = 443
  }
  set {
    name = "service.ports[1].targetPort"
    value = 3000
  }
  set {
    name = "service.targetPort"
    value = 3000
  }
  set {
    name = "image.registry"
    value = "${var.jfrog_registry}"
  }
  set {
    name = "image.repository"
    value = var.jfrog_repository
  }
  set {
    name = "image.tag"
    value = "${var.gogs_build_tag}"
  }
  set {
    name = "service.env[0].name"
    value = "MYSQL_DATABASE"
  }
  set {
    name = "service.env[0].value"
    value = var.mysql_db_name
  }
  set {
    name = "service.env[1].name"
    value = "MYSQL_ROOT_PASSWORD"
  }
  set {
    name = "service.env[1].value"
    value = kubernetes_secret.gogs_admin_password.data.password
  }
  set {
    name = "service.env[2].name"
    value = "MYSQL_USER"
  }
  set {
    name = "service.env[2].value"
    value = var.mysql_username
  }
  set {
    name = "service.env[3].name"
    value = "MYSQL_PASSWORD"
  }
  set {
    name = "service.env[3].value"
    value = kubernetes_secret.gogs_admin_password.data.password
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