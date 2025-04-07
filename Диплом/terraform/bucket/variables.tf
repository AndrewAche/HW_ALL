variable "yandex_cloud_id" {
  default = "b1gpm433o1t8c6iqf889"
}

variable "yandex_folder_id" {
  default = "b1g28u34etbvshh9gi63"
}

variable "a-zone" {
  default = "ru-central1-a"
}

variable "subnet-zones" {
  type    = list(string)
  default = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
}

variable "ubuntu-2004-lts" {
  default = "fd85u0rct32prepgjlv0"
}

variable "cidr" {
  type    = map(list(string))
  default = {
    stage = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  }
}


