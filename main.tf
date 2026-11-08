terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "class_api" {
  name         = "bubbaj/it4200-fall-2026:latest"
  keep_locally = false
}

resource "docker_container" "class_api" {
  image = docker_image.class_api.image_id
  name  = "terraform-class-api"

  ports {
    internal = 8000
    external = 8000
    ip       = "127.0.0.1"
  }
}

output "api_url" {
  description = "Class API address"
  value       = "http://localhost:8000"
}
