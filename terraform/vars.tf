variable "region" {
    type = string
    default = "asia-southeast2-a"
}

variable "project" {
    type = string
    default = "erudite-syntax-306003"
}

variable "machine_type" {
    type = string
    default = "e2-micro"
}

variable "credentials" {
    type = string
    default = "key-project.json"
}

variable "zones" {
    type = string
    default = "asia-southeast2-a"
}

variable "initial_node_count" {
    default = "3"
}

variable "node_count" {
    default = "3"
}

variable "namespace" {
    default = "project-akhir-namespace"  
}

variable "dbhost" {
    default = "project-akhir-db"
}

variable "dbuser" {
    default = "root"
}

variable "dbpassword" {
    default = "password"
}

variable "dbname" {
    default = "project-akhir-db"
  
}