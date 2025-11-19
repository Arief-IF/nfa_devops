terraform {
    required_providers {
        docker = {
        source  = "kreuzwerker/docker"
        version = "~> 3.0"
        }
    }
}

provider "docker" {}

# Resource = membuat container baru
resource "docker_container" "nginx" {
    image = "nginx:latest"
    name  = "my-nginx"
    ports {
        internal = 80
        external = 9090
    }
}

# Resource = image yang dipakai
resource "docker_image" "nginx" {
    name = "nginx:latest"
}

# Data Source = ambil informasi container network yang sudah ada
data "docker_network" "bridge" {
    name = "bridge"
}

# Output = menampilkan ID network bridge
output "bridge_network_id" {
    value = data.docker_network.bridge.id
}