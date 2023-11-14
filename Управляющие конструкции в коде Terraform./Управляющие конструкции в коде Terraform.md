# Домашнее задание к занятию  "Управляющие конструкции в коде Terraform" - `Ачеусов Андрей`

### Задание 1

1. Изучите проект.
2. Заполните файл personal.auto.tfvars.
3. Инициализируйте проект, выполните код. Он выполнится, даже если доступа к preview нет.

Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud или скриншот отказа в предоставлении доступа к preview-версии.  

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/d0072d66-8bb1-462c-9806-2664128a68ad)  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/34adc039-1506-47c2-8657-4daa858abc33)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/f3396d74-1238-4858-8013-fb42d02be3cf)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/e5bdfa82-ea9f-4f78-bb56-c7f914296667)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/7695ba0d-a33e-4e8c-8700-3617abb3dfea)


---


### Задание 2

1. Создайте файл count-vm.tf. Опишите в нём создание двух **одинаковых** ВМ  web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент **count loop**. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )

***Решение:***  
<details><summary></summary>

   ```
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family_image
}
resource "yandex_compute_instance" "web" {
  count = 2
  name = "develop-web-${count.index + 1}"
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

  network_interface {
        subnet_id = var.network_interface
        nat     = true
  }

  metadata = {
        serial-port-enable = 1
        ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }
}
  
```

</details>

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/4d28e368-7f51-499a-a548-0515cf16c9a1)


2. Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ с именами "main" и "replica" **разных** по cpu/ram/disk , используя мета-аргумент **for_each loop**. Используйте для обеих ВМ одну общую переменную типа list(object({ vm_name=string, cpu=number, ram=number, disk=number  })). При желании внесите в переменную все возможные параметры.

***Решение:***  
<details><summary></summary>

   ```
data "yandex_compute_image" "ubuntu2" {
  family = var.vm_web_family_image
}
resource "yandex_compute_instance" "for_each" {

depends_on = [ yandex_compute_instance.web ]

  for_each = { for vm in local.vms_fe: "${vm.vm_name}" => vm }
  name = each.key
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
  vms_fe = [
        {
        vm_name = "main"
        cpu     = 2
        ram     = 2
        frac    = 20
        },
        {
        vm_name = "replica"
        cpu     = 4
        ram     = 4
        frac    = 100
        }
  ]
}

locals {
  ssh = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
}
  
```

</details>

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/774954a7-9678-4929-b2d4-31ac3966a308)


3. ВМ из пункта 2.2 должны создаваться после создания ВМ из пункта 2.1.
4. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.
5. Инициализируйте проект, выполните код.

---


### Задание 3

1. Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле **disk_vm.tf** .
2. Создайте в том же файле **одиночную**(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage"  . Используйте блок **dynamic secondary_disk{..}** и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

***Решение:***  
<details><summary></summary>

   ```

  
```

</details>

---


### Задание 4

1. В файле ansible.tf создайте inventory-файл для ansible.
Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции.
Готовый код возьмите из демонстрации к лекции [**demonstration2**](https://github.com/netology-code/ter-homeworks/tree/main/03/demonstration2).
Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
2. Инвентарь должен содержать 3 группы [webservers], [databases], [storage] и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
4. Выполните код. Приложите скриншот получившегося файла. 

Для общего зачёта создайте в вашем GitHub-репозитории новую ветку terraform-03. Закоммитьте в эту ветку свой финальный код проекта, пришлите ссылку на коммит.   
**Удалите все созданные ресурсы**.

***Решение:***  
<details><summary></summary>

   ```

  
```

</details>

---
