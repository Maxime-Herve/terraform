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
    external = var.starting_port + count.index
  }

  upload {
    content = file("index.html")
    file    = "/usr/share/nginx/html/index.html"
  }

  upload {
    content = file("nginx.conf")
    file    = "/etc/nginx/conf.d/default.conf"
  }
}
