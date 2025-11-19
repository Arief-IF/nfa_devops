terraform {
    required_providers {
        docker = {
        source  = "kreuzwerker/docker"
        version = "~> 3.0"
        }
    }
}

provider "docker" {
    host = "npipe:////./pipe/docker_engine"
}

# Buat Volume (mirip EBS di AWS)
resource "docker_volume" "storage" {
    name = var.volume_name
}

# Pull Image Nginx
resource "docker_image" "nginx" {
    name = "nginx:latest"
}

# Jalankan Container (mirip EC2)
resource "docker_container" "web" {
    name  = var.container_name
    image = "nginx:latest"

    # Mount volume
    mounts {
        target = "/usr/share/nginx/html"
        source = docker_volume.storage.name
        type   = "volume"
    }

    # Map port
    ports {
        internal = 80
        external = var.host_port
    }

    # Entry script dijalankan langsung di command
    command = [
        "sh", "-c",
        "echo '<h1>Hello from entry_script Arief Ichwan Fanani (Terraform + Docker Windows)</h1>' > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"
    ]
}