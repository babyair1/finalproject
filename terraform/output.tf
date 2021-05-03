output "name" {
  value = google_container_cluster.project-akhir.name
}

output "endpoint" {
  value = google_container_cluster.project-akhir.endpoint
}

output "instance_group_urls" {
  value = google_container_cluster.project-akhir.instance_group_urls
}

output "node_pool" {
  value = google_container_cluster.project-akhir.node_pool
}

output "ip_jenkins" {
  value = google_compute_instance.project-akhir.network_interface.0.access_config.0.nat_ip
}