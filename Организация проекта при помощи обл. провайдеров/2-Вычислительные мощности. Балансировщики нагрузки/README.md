# [Домашнее задание](https://github.com/netology-code/clopro-homeworks/blob/main/15.2.md) к занятию  "Вычислительные мощности. Балансировщики нагрузки" - `Ачеусов Андрей`


### Задание 1. Yandex Cloud 

Полезные документы:

- [Compute instance group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance_group).
- [Network Load Balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer).
- [Группа ВМ с сетевым балансировщиком](https://cloud.yandex.ru/docs/compute/operations/instance-groups/create-with-balancer).
 
  
**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
[Бакет](https://github.com/AndrewAche/HW_ALL/blob/main/Организация%20проекта%20при%20помощи%20обл.%20провайдеров/2-Вычислительные%20мощности.%20Балансировщики%20нагрузки/bucket.tf)  

![image](https://github.com/user-attachments/assets/c68ae473-cf50-43d0-b024-d3b879b62627)  

Скрин картинки в бакете

![image](https://github.com/user-attachments/assets/c9a5da68-b344-495c-9dac-788a3b6e4721)  


Полученная ссылка для скачивания:

```
"http://1netology-bucket.storage.yandexcloud.net/lake-in-mountains.jpg"

```


2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.

[Instance Group](https://github.com/AndrewAche/HW_ALL/blob/main/Организация%20проекта%20при%20помощи%20обл.%20провайдеров/2-Вычислительные%20мощности.%20Балансировщики%20нагрузки/instance-group.tf)

Скрин Instance Group
 
![image](https://github.com/user-attachments/assets/8613dbae-4f0b-4b32-aa50-d00e98856b7a)  

Скрин Target Group

![image](https://github.com/user-attachments/assets/3ceb654c-5bfa-4fff-a749-a69d3acff0fb)  


Скрин картинки на инстансах из Instance Group 

![image](https://github.com/user-attachments/assets/29993672-2860-4c5a-be06-cfed7bd60829)  


3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.

[Load-balancer](https://github.com/AndrewAche/HW_ALL/blob/main/Организация%20проекта%20при%20помощи%20обл.%20провайдеров/2-Вычислительные%20мощности.%20Балансировщики%20нагрузки/lb.tf)  

Проверка работоспособности при удалении одной машины

![image](https://github.com/user-attachments/assets/2a5b97c9-8078-4e9d-80ca-356e1a4a8ebc) 

[terraform](https://github.com/AndrewAche/HW_ALL/tree/main/Организация%20проекта%20при%20помощи%20обл.%20провайдеров/2-Вычислительные%20мощности.%20Балансировщики%20нагрузки)

root@acheusov2:/home/acheusov2/15.2_Computing_power# terraform apply  

```
yandex_iam_service_account.sa-bucket: Creating...
yandex_iam_service_account.sa-bucket: Still creating... [10s elapsed]
yandex_iam_service_account.sa-bucket: Creation complete after 16s [id=ajenva29casfbm48tp7j]
yandex_resourcemanager_folder_iam_member.bucket-editor: Creating...
yandex_iam_service_account_static_access_key.sa-static-key: Creating...
yandex_iam_service_account_static_access_key.sa-static-key: Creation complete after 4s [id=aje88rii9vd27hilo99j]
yandex_storage_bucket.netology-bucket: Creating...
yandex_resourcemanager_folder_iam_member.bucket-editor: Creation complete after 5s [id=b1gi8mor51pqsp67s6t9/storage.editor/serviceAccount:ajenva29casfbm48tp7j]
yandex_storage_bucket.netology-bucket: Still creating... [10s elapsed]
yandex_storage_bucket.netology-bucket: Creation complete after 15s [id=1netology-bucket]
yandex_storage_object.object-1: Creating...
yandex_compute_instance_group.ig-1: Creating...
yandex_storage_object.object-1: Still creating... [10s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [10s elapsed]
yandex_storage_object.object-1: Creation complete after 19s [id=lake-in-mountains.jpg]
yandex_compute_instance_group.ig-1: Still creating... [20s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [30s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [40s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [50s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [1m0s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [1m10s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [1m20s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [1m30s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [1m40s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [1m50s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [2m0s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [2m10s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [2m20s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [2m30s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [2m40s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [2m50s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [3m0s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [3m10s elapsed]
yandex_compute_instance_group.ig-1: Still creating... [3m20s elapsed]
yandex_compute_instance_group.ig-1: Creation complete after 3m21s [id=cl1iji7rmn81ju6tfpr8]
yandex_lb_network_load_balancer.load-balancer-1: Creating...
yandex_lb_network_load_balancer.load-balancer-1: Creation complete after 7s [id=enpm48u7i4c8rafrua6t]

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

bucket_domain_name = "http://1netology-bucket.storage.yandexcloud.net/lake-in-mountains.jpg"
external_load_balancer_ip = "158.160.147.17"
root@acheusov2:/home/acheusov2/15.2_Computing_power# 
```

