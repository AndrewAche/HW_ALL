# Домашнее задание к занятию  "Основы Terraform. Yandex Cloud" - `Ачеусов Андрей`

### Задание 1

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные: идентификаторы облака, токен доступа. Благодаря .gitignore этот файл не попадёт в публичный репозиторий. Вы можете выбрать иной способ безопасно передать секретные данные в terraform.
3. Сгенерируйте или используйте свой текущий ssh-ключ. Запишите его открытую часть в переменную vms_ssh_root_key.
4. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
5. Ответьте, как в процессе обучения могут пригодиться параметры `preemptible = true` и `core_fraction=5` в параметрах ВМ. Ответ в документации Yandex Cloud.

Решение:  

- скриншот ЛК Yandex Cloud с созданной ВМ:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/fb191af1-1cb6-4287-a2a5-b20470b0f140)  

- скриншот успешного подключения к консоли ВМ через ssh. К OS ubuntu необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address":  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/77e0fef9-0499-4890-9391-ddca42980074)  

- ответы на вопросы в п. 4, 5:  
Терраформ подсказал, где находится и в чём ошибка:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/add06191-bf65-4dab-a6d1-88b1e5d5467c)  
И ещё одна:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/9c05c5cc-9073-40d7-8f13-140c5a3acbfe)  
Таким образом, сперва была допущена ошибка в термине `standarT-v4`, затем выяснилось, что мин. кол-во ядер для стандарта = 2, а не 1  
   
Параметр `preemptible = true` означает, что будет создана прерываюмая ВМ, которая работает не более 24 часов и может быть остановлена Compute Cloud в любой момент.  
Параметр `core_fraction=5`  указывает базовую производительность ядра в процентах. Гарантированная доля vCPU, которая будет выделена ВМ. ВМ с гарантированной долей меньше 100% обеспечивают указанный уровень производительности с вероятностью временного повышения вплоть до 100%. Такие ВМ подходят для задач, которые не требуют постоянной гарантии производительности vCPU на 100%. Подойдёт для обучения, уменьшение затрат на ВМ.  


---


### Задание 2

1. Изучите файлы проекта.
2. Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
3. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
4. Проверьте terraform plan. Изменений быть не должно.

Введены новые переменные:  
```
###yandex_compute_image vars

variable "vm_web_family_image" {
  type        = string
  default     = "ubuntu-2004-lts"
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
```
Переменные внесены в main.tf:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/44e6a3c7-150a-4f85-a254-21a9e123af89)  

По итогу:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/e78edb8f-6f86-44b3-87b2-d7139b4fba7f)  


---


### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf').
3. Примените изменения.

НЕ УДАЁТСЯ ВЫПОЛНИТЬ:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/ad552217-0400-4c34-9499-528c048ebe63)  

main.tf  
<details><summary></summary>

   ```
   
   resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family_image
}
resource "yandex_compute_instance" "platform" {
  name        = "netology-develop-platform-web"
  platform_id = "standard-v1"
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}


resource "vm_db_yandex_vpc_network" "vm_db_develop" {
  name = var.vm_db_vpc_name
}
resource "vm_db_yandex_vpc_subnet" "vm_db_develop" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}


data "vm_db_yandex_compute_image" "vm_db_ubuntu" {
  family = var.vm_db_family_image
}
resource "vm_db_yandex_compute_instance" "vm_db_platform" {
  name        = "netology-develop-platform-db"
  platform_id = "standard-v1"
  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = vm_db_yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vm_db_vms_ssh_root_key}"
  }

}

```

</details>

vms_platform.tf:  
<details><summary></summary>

   ```
 GNU nano 5.4                                                                                                                             vms_platform.tf                                                                                                                                      ###cloud vars
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
  
```

</details>

ПРИ ЭТОМ В КОРНЕ ФАЙЛ .terraformrc СУЩЕСТВУЕТ  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/4cbf01e0-c603-44b0-a68e-ab8ee96da732)  



---


### Задание 4

1. Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды `terraform output`.  

ОТВЕТ:  



---


### Задание 5

1. В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
2. Замените переменные с именами ВМ из файла variables.tf на созданные вами local-переменные.
3. Примените изменения.


---


### Задание 6

1. Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в переменные типа map с именами "vm_web_resources" и "vm_db_resources". В качестве продвинутой практики попробуйте создать одну map-переменную vms_resources и уже внутри неё конфиги обеих ВМ — вложенный map.
2. Также поступите с блоком metadata {serial-port-enable, ssh-keys}, эта переменная должна быть общая для всех ваших ВМ.
3. Найдите и удалите все более не используемые переменные проекта.
4. Проверьте terraform plan. Изменений быть не должно.


---




