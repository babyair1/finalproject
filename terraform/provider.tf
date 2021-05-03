provider "google" {
  project      = var.project
  region       = var.region
  credentials  = file(var.credentials)
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}