data "yandex_compute_image" "ubuntu2" {
  family = var.vm_web_family_image
}
resource "yandex_compute_instance" "for_each" {

depends_on = [ yandex_compute_instance.web ]

  for_each = { for vm in var.vms_settings: index(var.vms_settings,vm)=> vm }
  name        = each.value.vm_name
  resources {
        cores           = each.value.cpu
        memory          = each.value.ram
        core_fraction = each.value.frac
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
        ssh-keys = local.ssh
  }
}


locals {
  ssh = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
}
