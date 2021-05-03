resource "kubernetes_namespace" "project-namespace" {
  metadata {
    name = "project-akhir-namespace"
  }
}

resource "google_container_cluster" "project-akhir" {
  name     = "project-akhir"
  location = var.zones

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  # remove_default_node_pool = true
  initial_node_count       = var.initial_node_count


# resource "google_container_node_pool" "primary_preemptible_nodes" {
#   name       = "my-node-pool"
#   location   = "asia-southeast2-a"
#   cluster    = google_container_cluster.project-akhir
#   node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}