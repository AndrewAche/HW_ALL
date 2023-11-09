###cloud vars
variable "vm_db_token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "vm_db_cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "vm_db_folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vm_db_vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILAMh6TvsiZqCmLIPkh6IpvzfapcKAYFd23iPVLnilIa Андрей@Andreys-machine"
  description = "ssh-keygen -t ed25519"
}


###yandex_compute_image vars

variable "vm_db_family_image" {
  type        = string
  default     = "ubuntu-2004-lts"
}


###yandex_compute_instance vars

variable "vm_db_cores" {
  type        = number
  default     = 2
}

variable "vm_db_memory" {
  type        = number
  default     = 3
}

variable "vm_db_fraction" {
  type        = number
  default     = 20
}
