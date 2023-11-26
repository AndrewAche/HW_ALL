data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family_image
}
resource "yandex_compute_instance" "web" {
  count = 2
  name = "develop-web-${count.index + 1}"
  resources {
        cores           = var.vm_web_cores
        memory          = var.vm_web_memory
        core_fraction = var.vm_web_fraction
  }

  boot_disk {
        initialize_params {
           image_id = data.yandex_compute_image.ubuntu.image_id
        }
  }

  network_interface {
        subnet_id = var.network_interface
        nat     = true
  }

  metadata = {
        serial-port-enable = 1
        ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }
}
