resource "yandex_compute_disk" "stor" {
  count = 3
  name  = "disk-${count.index + 1}"
  size  = 1
}

data "yandex_compute_image" "ubuntu3" {
  family = var.vm_web_family_image
}
resource "yandex_compute_instance" "storage" {
  name = "storage"
  resources {
        cores           = 2
        memory          = 1
        core_fraction = 5
  }

  boot_disk {
        initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
        }
  }

  dynamic "secondary_disk" {
   for_each = "${yandex_compute_disk.stor.*.id}"
   content {
        disk_id = yandex_compute_disk.stor["${secondary_disk.key}"].id
   }
  }

  network_interface {
        subnet_id = var.network_interface
        nat     = true
  }

  metadata = {
        ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
