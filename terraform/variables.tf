# terraform\variables.tf
variable "cluster_name" {
  description = "Nombre del cluster o entorno"
  type        = string
  default     = "entorno-testing"
}

variable "base_image" {
  description = "Ruta al archivo de imagen base para las VMs"
  type        = string
}

variable "machines" {
  description = "Lista de nombres de máquinas virtuales a crear"
  type        = list(string)
}

variable "ssh_keys" {
  description = "Claves SSH para inyectar en las máquinas virtuales"
  type        = list(string)
}

variable "virtual_cpus" {
  description = "Número de CPUs virtuales para asignar a cada VM"
  type        = number
}

variable "virtual_memory" {
  description = "Cantidad de memoria (en MB) para asignar a cada VM"
  type        = number
}