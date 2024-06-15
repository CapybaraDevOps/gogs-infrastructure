resource "helm_release" "gogs-app" {
  name       = "gogs-app"
  repository = var.helm_repo
  chart      = "gogsapp"
  namespace  = "gogs-app"
  depends_on = [kubernetes_namespace.gogs-app]
  timeout    = 900
  repository_username = var.jfrog_username
  repository_password = var.jfrog_password
}