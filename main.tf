locals {
  vector_container = {
    name  = "vector-sidecar"
    image = "timberio/vector:0.45.0-alpine"
    resources = {
      limits = {
        cpu    = var.vector_resources.cpu
        memory = var.vector_resources.memory
      }
    }
    env = [
      for key, value in var.vector_env_vars : {
        name  = key
        value = value
      }
    ]
    volume_mounts = [
      for vm in var.vector_volume_mounts : {
        name       = vm.name
        mount_path = vm.mount_path
      }
    ]
  }
}

output "vector_container" {
  description = "Vector sidecar container definition"
  value       = local.vector_container
}
