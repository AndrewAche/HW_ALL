###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILAMh6TvsiZqCmLIPkh6IpvzfapcKAYFd23iPVLnilIa Андрей@Andreys-machine"
  description = "ssh-keygen -t ed25519"
}

###yandex_compute_image vars

variable "vm_web_family_image" {
  type        = string
  default     = "ubuntu-2004-lts"
}


variable "network_interface" {
  type        = string
  default     = "e9bhbgch29gu08s5ma4n"
}

###for each_vm

variable "vms_settings"{
  type=list(object({ vm_name=string, cpu=number, ram=number, frac=number }))
  default = [{
    vm_name="main"
    cpu=2
    ram=2
    frac=20
  },
  {
    vm_name="replica"
    cpu=4
    ram=4
    frac=100
  }]
}

###yandex_compute_instance vars

variable "vm_web_cores" {
  type        = number
  default     = 2
}

variable "vm_web_memory" {
  type        = number
  default     = 1
}

variable "vm_web_fraction" {
  type        = number
  default     = 5
}
