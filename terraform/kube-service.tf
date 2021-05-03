resource "kubernetes_service" "adminer" {
  metadata {
    name = "project-akhir-adminer"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = "project-akhir-adminer"
    }
    port {
      port        = 8080
      target_port = 8080
      node_port = 30012
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "project-akhir-frontend"
    namespace = var.namespace
  }
  spec {
    selector = {
       app = "project-akhir-frontend"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "backend" {
  metadata {
    name = "project-akhir-backend"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = "project-akhir-backend"
    }
    session_affinity = "ClientIP"
    port {
      port        = 2000
      target_port = 2000
      node_port = 30011
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "db" {
  metadata {
    name = "project-akhir-db"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = "project-db"
    }
    port {
      port        = 3306
      target_port = 3306
    }

    type = "ClusterIP"
  }
}