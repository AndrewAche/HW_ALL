# [Домашнее задание](https://github.com/netology-code/clopro-homeworks/blob/main/15.2.md) к занятию  "Вычислительные мощности. Балансировщики нагрузки" - `Ачеусов Андрей`


### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.
 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.

Полезные документы:

- [Compute instance group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance_group).
- [Network Load Balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer).
- [Группа ВМ с сетевым балансировщиком](https://cloud.yandex.ru/docs/compute/operations/instance-groups/create-with-balancer).

---
### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
[Бакет](https://github.com/12sergey12/15.2_Computing_power_load_balancer/blob/main/bucket.tf)

![monitoring](https://github.com/12sergey12/15.2_Computing_power_load_balancer/blob/main/images/15.2_bucket.png)

скрин картинки в бакете

![monitoring](https://github.com/12sergey12/15.2_Computing_power_load_balancer/blob/main/images/15.2_ycl.net.png)


Полученная ссылка для скачивания:

```
"http://1netology-bucket.storage.yandexcloud.net/lake-in-mountains.jpg"

```


2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.

[Instance Group](https://github.com/12sergey12/15.2_Computing_power_load_balancer/blob/main/instance-group.tf)

Скрин Instance Group
 
![monitoring](https://github.com/12sergey12/15.2_Computing_power_load_balancer/blob/main/images/15.2_inst_gr.png)

Скрин Target Group

![monitoring](https://github.com/12sergey12/15.2_Computing_power_load_balancer/blob/main/images/15.2_targ_gr.png)

Скрин картинки на инстансах из Instance Group 

![monitoring](https://github.com/12sergey12/15.2_Computing_power_load_balancer/blob/main/images/15.2_inst.png)


3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.

[load-balancer](https://github.com/12sergey12/15.2_Computing_power_load_balancer/blob/main/lb.tf)

Проверка работоспособности при удалении одной машины

![monitoring](https://github.com/12sergey12/15.2_Computing_power_load_balancer/blob/main/images/15.2_l_bal.png)

[terraform]()

