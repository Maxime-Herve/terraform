resource "docker_image" "nginx" {
  name         = var.image
}

resource "docker_container" "nginx" {
  count = var.num_containers
  image = docker_image.nginx.image_id
  name  = "nginx-container-${count.index}"

  memory = var.memory
  privileged = var.privileged

  ports {
    internal = 80
    external = 8000
  }
}
