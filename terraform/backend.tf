terraform {
  backend "gcs" {
    bucket  = "project-akhir-sendy"
    prefix  = "terraform/state"
    credentials = "key-project.json"
  }
}