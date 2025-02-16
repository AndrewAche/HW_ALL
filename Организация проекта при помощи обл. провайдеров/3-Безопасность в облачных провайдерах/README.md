# [Домашнее задание](https://github.com/netology-code/clopro-homeworks/blob/main/15.3.md) к занятию  "Безопасность в облачных провайдерах" - `Ачеусов Андрей`

### Задание 1. Yandex Cloud   

1. С помощью ключа в KMS необходимо зашифровать содержимое бакета:

 - создать ключ в KMS;
 - с помощью ключа зашифровать содержимое бакета, созданного ранее.

[terraform]()

[kms.tf](https://github.com/AndrewAche/HW_ALL/blob/main/Организация%20проекта%20при%20помощи%20обл.%20провайдеров/3-Безопасность%20в%20облачных%20провайдерах/kms.tf)

root@acheusov2:/home/acheusov2/15.3_sertificat# terraform plan

```
...
yandex_vpc_network.network-1: Creating...
yandex_iam_service_account.sa-ig: Creating...
yandex_iam_service_account.sa-bucket: Creating...
yandex_kms_symmetric_key.key-a: Creating...
yandex_kms_symmetric_key.key-a: Creation complete after 2s [id=abjt33v8tpuph3fr9mf8]
yandex_vpc_network.network-1: Creation complete after 4s [id=enp7kpdca51gli9bcdai]
yandex_vpc_subnet.subnet-public: Creating...
yandex_vpc_subnet.subnet-public: Creation complete after 0s [id=e9brlcfhql0fcn0nej71]
yandex_iam_service_account.sa-ig: Creation complete after 4s [id=ajegta0tblurnf4vvovm]
yandex_resourcemanager_folder_iam_member.ig-editor: Creating...
yandex_iam_service_account.sa-bucket: Creation complete after 6s [id=aje62gh101m9ada6bb9n]
yandex_resourcemanager_folder_iam_member.bucket-editor: Creating...
yandex_iam_service_account_static_access_key.sa-static-key: Creating...
yandex_resourcemanager_folder_iam_member.ig-editor: Creation complete after 3s [id=b1gi8mor51pqsp67s6t9/editor/serviceAccount:ajegta0tblurnf4vvovm]
yandex_iam_service_account_static_access_key.sa-static-key: Creation complete after 2s [id=aje55kh75e1r079n2453]
yandex_storage_object.index: Creating...
yandex_storage_bucket.web_bucket: Creating...
yandex_storage_object.object: Creating...
yandex_storage_bucket.bucket: Creating...
yandex_storage_object.index: Creation complete after 1s [id=index.html]
yandex_storage_object.object: Creation complete after 1s [id=index.html]
yandex_resourcemanager_folder_iam_member.bucket-editor: Creation complete after 4s [id=b1gi8mor51pqsp67s6t9/storage.editor/serviceAccount:aje62gh101m9ada6bb9n]
yandex_storage_bucket.web_bucket: Still creating... [10s elapsed]
yandex_storage_bucket.bucket: Still creating... [10s elapsed]
yandex_storage_bucket.bucket: Still creating... [20s elapsed]
yandex_storage_bucket.web_bucket: Still creating... [20s elapsed]
yandex_storage_bucket.bucket: Still creating... [30s elapsed]
yandex_storage_bucket.web_bucket: Still creating... [30s elapsed]
yandex_storage_bucket.web_bucket: Still creating... [40s elapsed]
yandex_storage_bucket.bucket: Still creating... [40s elapsed]
yandex_storage_bucket.bucket: Still creating... [50s elapsed]
yandex_storage_bucket.web_bucket: Still creating... [50s elapsed]
yandex_storage_bucket.web_bucket: Still creating... [1m0s elapsed]
yandex_storage_bucket.bucket: Still creating... [1m0s elapsed]
yandex_storage_bucket.bucket: Creation complete after 1m5s [id=baranovsa-bucket]
yandex_storage_bucket.web_bucket: Still creating... [1m10s elapsed]
yandex_storage_bucket.web_bucket: Creation complete after 1m16s [id=baranovsa.ru]
yandex_compute_instance_group.ig-1: Creating...
yandex_compute_instance_group.ig-1: Still creating... [10s elapsed]
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
yandex_compute_instance_group.ig-1: Creation complete after 3m14s [id=cl1pk9fsu0ottlaok8cj]
yandex_lb_network_load_balancer.load-balancer-1: Creating...
yandex_lb_network_load_balancer.load-balancer-1: Creation complete after 4s [id=enpl11dh35ugs05bjcd9]

Apply complete! Resources: 14 added, 0 changed, 0 destroyed.

Outputs:

external_load_balancer_ip = "158.160.165.187"
root@acheusov2:/home/acheusov2/15.3_sertificat# 


```


------

![image](https://github.com/user-attachments/assets/451d28b7-7136-452e-b929-b00425afa298)   
![image](https://github.com/user-attachments/assets/a2762e13-dc39-4e2e-b995-4f11690006db)   



2. (Выполняется не в Terraform)* Создать статический сайт в Object Storage c собственным публичным адресом и сделать доступным по HTTPS:

 - создать сертификат;
 - создать статическую страницу в Object Storage и применить сертификат HTTPS;
 - в качестве результата предоставить скриншот на страницу с сертификатом в заголовке (замочек).

Полезные документы:

- [Настройка HTTPS статичного сайта](https://cloud.yandex.ru/docs/storage/operations/hosting/certificate).
- [Object Storage bucket](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/storage_bucket).
- [KMS key](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kms_symmetric_key).

--- 

![image](https://github.com/user-attachments/assets/1b75a34a-2f0b-4d93-9e0a-f436155f6a73)



