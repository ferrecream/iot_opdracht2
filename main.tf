
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "ghcr.io/ferrecream/iot_opdracht2/game:sha-555fbb4"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "iotTask2"
  must_run = false
  ports {
    internal = 80
    external = 8000
  }
}
