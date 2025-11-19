variable "container_name" {
    description = "Nama container"
    type        = string
    default     = "demo-automate"
}

variable "host_port" {
    description = "Port host"
    type        = number
    default     = 8080
}

variable "volume_name" {
    description = "Nama volume docker"
    type        = string
    default     = "demo_volume"
}