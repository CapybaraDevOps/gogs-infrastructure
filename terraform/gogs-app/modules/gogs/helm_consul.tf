resource "helm_release" "consul" {
  name       = "consul"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  namespace  = kubernetes_namespace.consul.metadata[0].name
  timeout             = 420
  #version    = "1.2.0"

  values = [
    file("values-v1.yaml")
  ]
  set {
    name  = "global.datacenter"
    value = "dev-capybara-01"
  }
}