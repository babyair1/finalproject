resource "kubernetes_deployment" "adminer" {
  metadata {
    name = "kubernetes-adminer"
    # labels = {
    #   app = "project-akhir-adminer"
    # }
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "project-akhir-adminer"
      }
    }

    template {
      metadata {
        labels = {
          app = "project-akhir-adminer"
          type = "tools"
        }
      }

      spec {
        container {
          image = "adminer"
          name  = "project-akhir-adminer"
        port {
          container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "kubernetes-frontend"
    # labels = {
    #   app = "project-akhir-frontend"
    # }
    namespace = var.namespace
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "project-akhir-frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "project-akhir-frontend"
          type = "frontend"
        }
      }

      spec {
        container {
          image = "sendykris/rigup_frontend:0.8"
          name  = "project-akhir-frontend"

        port {
          container_port = 80
        }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "backend" {
  metadata {
    name = "project-akhir-backend"
    # labels = {
    #   app = "project-akhir-backend"
    # }
    namespace = var.namespace
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "project-akhir-backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "project-akhir-backend"
          type = ""
        }
      }

      spec {
        container {
          image = "sendykris/rigup_backend:0.2"
          name  = "project-akhir-backend"
        port {
          container_port = 2000
        }

        env {
          name = "DB_HOST"
          value = var.dbhost
        }
       
        env {
          name = "DB_USER"
          value = var.dbuser
        }

        env {
          name = "DB_PASSWORD"
          value = var.dbpassword
        }

        env {
          name = "DB_NAME"
          value = var.dbname
        }
      }
      }
    }
  }
}

resource "kubernetes_deployment" "db" {
  metadata {
    name = "project-akhir-db"
    # labels = {
    #   app = "project-akhir-db"
    # }
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "project-db"
      }
    }

    template {
      metadata {
        labels = {
          app = "project-db"
        }
      }

      spec {
        container {
          image = "mariadb"
          name  = "project-akhir-db"

        port {
          container_port = 3306
        }

        env {
          name = "MYSQL_ROOT_PASSWORD"
          value = "password"
        }

        env {
          name = "MYSQL_DATABASE"
          value = "project-akhir-db"
        }
        }
      }
    }
  }
}

