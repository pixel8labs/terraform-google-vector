variable "vector_env_vars" {
  description = "Environment variables for the Vector sidecar"
  type        = map(string)
  default     = {}
}

variable "vector_volume_mounts" {
  description = "Volume mounts for the Vector sidecar"
  type = list(object({
    name       = string
    mount_path = string
  }))
  default = [{
    name = "logs"
    mount_path = "/var/log/app"
  }]
}

variable "vector_resources" {
  description = "Resource limits for the Vector sidecar container"
  type = object({
    cpu    = string
    memory = string
  })
  default = {
    cpu    = "0.5"
    memory = "256Mi"
  }
}
