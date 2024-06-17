module "network" {
  source = "../modules/network"
  region = var.region
  env = var.env
}