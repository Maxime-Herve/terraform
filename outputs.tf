output "container_names" {
  value = docker_container.nginx[*].name
}

output "container_ports" {
  value = [for i in range(var.num_containers) : var.starting_port + i]
}
