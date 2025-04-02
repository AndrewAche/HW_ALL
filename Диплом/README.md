# [Дипломный практикум в Yandex.Cloud](https://github.com/netology-code/devops-diplom-yandexcloud) - `Ачеусов Андрей`
  * [Цели:](#цели)
  * [Этапы выполнения:](#этапы-выполнения)
     * [Создание облачной инфраструктуры](#создание-облачной-инфраструктуры)
     * [Создание Kubernetes кластера](#создание-kubernetes-кластера)
     * [Создание тестового приложения](#создание-тестового-приложения)
     * [Подготовка cистемы мониторинга и деплой приложения](#подготовка-cистемы-мониторинга-и-деплой-приложения)
     * [Установка и настройка CI/CD](#установка-и-настройка-cicd)


---
## Цели:

1. Подготовить облачную инфраструктуру на базе облачного провайдера Яндекс.Облако.
2. Запустить и сконфигурировать Kubernetes кластер.
3. Установить и настроить систему мониторинга.
4. Настроить и автоматизировать сборку тестового приложения с использованием Docker-контейнеров.
5. Настроить CI для автоматической сборки и тестирования.
6. Настроить CD для автоматического развёртывания приложения.

---
## Этапы выполнения:


### Создание облачной инфраструктуры

Для начала необходимо подготовить облачную инфраструктуру в ЯО при помощи [Terraform](https://www.terraform.io/).

Особенности выполнения:

- Бюджет купона ограничен, что следует иметь в виду при проектировании инфраструктуры и использовании ресурсов;
Для облачного k8s используйте региональный мастер(неотказоустойчивый). Для self-hosted k8s минимизируйте ресурсы ВМ и долю ЦПУ. В обоих вариантах используйте прерываемые ВМ для worker nodes.

Предварительная подготовка к установке и запуску Kubernetes кластера.

1. Создайте сервисный аккаунт, который будет в дальнейшем использоваться Terraform для работы с инфраструктурой с необходимыми и достаточными правами. Не стоит использовать права суперпользователя
2. Подготовьте [backend](https://developer.hashicorp.com/terraform/language/backend) для Terraform:  
   а. Рекомендуемый вариант: S3 bucket в созданном ЯО аккаунте(создание бакета через TF)
   б. Альтернативный вариант:  [Terraform Cloud](https://app.terraform.io/)
3. Создайте конфигурацию Terrafrom, используя созданный бакет ранее как бекенд для хранения стейт файла. Конфигурации Terraform для создания сервисного аккаунта и бакета и основной инфраструктуры следует сохранить в разных папках.
4. Создайте VPC с подсетями в разных зонах доступности.
5. Убедитесь, что теперь вы можете выполнить команды `terraform destroy` и `terraform apply` без дополнительных ручных действий.
6. В случае использования [Terraform Cloud](https://app.terraform.io/) в качестве [backend](https://developer.hashicorp.com/terraform/language/backend) убедитесь, что применение изменений успешно проходит, используя web-интерфейс Terraform cloud.

Ожидаемые результаты:

1. Terraform сконфигурирован и создание инфраструктуры посредством Terraform возможно без дополнительных ручных действий, стейт основной конфигурации сохраняется в бакете или Terraform Cloud
2. Полученная конфигурация инфраструктуры является предварительной, поэтому в ходе дальнейшего выполнения задания возможны изменения.

### Решение
1.  
![image](https://github.com/user-attachments/assets/af930acb-8d6e-42ff-a5fe-3f396b3de394)  
![image](https://github.com/user-attachments/assets/60bfef52-4e80-4534-86c7-6353ad1140aa)  
2.  
![image](https://github.com/user-attachments/assets/8687d9ff-f686-415a-9b79-e15304e1765f)  
![image](https://github.com/user-attachments/assets/32713597-a204-4fa6-9e5c-c4c428d9002e)  
3.  
![image](https://github.com/user-attachments/assets/324ec9bb-290e-4053-b5eb-368239a2099c)  
4.  
![image](https://github.com/user-attachments/assets/42552216-e1c4-41ec-b8d4-ad9cdb842be1)  
![image](https://github.com/user-attachments/assets/98de4658-47ca-4b22-aa3c-ac99b3781f9a)  
5.  
Могу выполнить команды terraform destroy и terraform apply без дополнительных ручных действий (Повторный прогон команды terraform apply):   
ВНИМАНИЕ! Ошибка связана со 2-м неиспользуемым бакетом, по непонятной причине не могу его удалить. На выполнение задания не влияет  
  
```
acheusov2@acheusov2:~/Diplom/cloud-terraform$ terraform apply -auto-approve
yandex_storage_bucket.iam-bucket: Refreshing state... [id=acheusov.netology]
yandex_vpc_network.subnet-zones: Refreshing state... [id=enp40f6286q064j6ijrh]
yandex_iam_service_account.sa-terraform: Refreshing state... [id=ajedh5h66hppu9rs32de]
yandex_resourcemanager_folder_iam_member.terraform-editor: Refreshing state... [id=b1g28u34etbvshh9gi63/editor/serviceAccount:ajedh5h66hppu9rs32de]
yandex_iam_service_account_static_access_key.sa-static-key: Refreshing state... [id=ajedgoc5vnj0evqmaenh]
yandex_vpc_subnet.subnet-zones[1]: Refreshing state... [id=e2l0h62ro5sujus6pl1e]
yandex_vpc_subnet.subnet-zones[0]: Refreshing state... [id=e9bkde4ad36q2jhub0f1]
yandex_vpc_subnet.subnet-zones[2]: Refreshing state... [id=fl8k7rvsuf91t2401lpo]
yandex_storage_bucket.netology-bucket: Refreshing state... [id=acheusov-netology-bucket]
yandex_storage_object.object-1: Refreshing state... [id=terraform.tfstate]
local_file.backendConf: Refreshing state... [id=9dd206186be312c012416264c739760fd04df31e]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # yandex_storage_bucket.iam-bucket must be replaced
-/+ resource "yandex_storage_bucket" "iam-bucket" {
      ~ bucket                = "acheusov.netology" -> "acheusov-netology-bucket" # forces replacement
      ~ bucket_domain_name    = "acheusov.netology.storage.yandexcloud.net" -> (known after apply)
      ~ default_storage_class = "STANDARD" -> (known after apply)
      ~ id                    = "acheusov.netology" -> (known after apply)
      - max_size              = 0 -> null
      - tags                  = {} -> null
      + website_domain        = (known after apply)
      + website_endpoint      = (known after apply)
        # (3 unchanged attributes hidden)

      ~ anonymous_access_flags (known after apply)
      - anonymous_access_flags {
          - config_read = false -> null
          - list        = false -> null
          - read        = false -> null
        }

      ~ versioning (known after apply)
      - versioning {
          - enabled = false -> null
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
yandex_storage_bucket.iam-bucket: Destroying... [id=acheusov.netology]
yandex_storage_bucket.iam-bucket: Still destroying... [id=acheusov.netology, 10s elapsed]
yandex_storage_bucket.iam-bucket: Still destroying... [id=acheusov.netology, 20s elapsed]
yandex_storage_bucket.iam-bucket: Still destroying... [id=acheusov.netology, 30s elapsed]
╷
│ Error: error deleting Storage Bucket (acheusov.netology): timeout while waiting for state to become 'success' (timeout: 5s)
│
│
╵
acheusov2@acheusov2:~/Diplom/cloud-terraform$

```
В рамках задания и для дальнйешего использования были также создан кластер из 3 ВМ:  
![image](https://github.com/user-attachments/assets/8b816cb3-d965-45d7-a2b4-c1852d0a1c59)  
   
Полученная конфигурация инфраструктуры является предварительной, поэтому в ходе дальнейшего выполнения задания возможны изменения.  


---
### Создание Kubernetes кластера

На этом этапе необходимо создать [Kubernetes](https://kubernetes.io/ru/docs/concepts/overview/what-is-kubernetes/) кластер на базе предварительно созданной инфраструктуры.   Требуется обеспечить доступ к ресурсам из Интернета.

Это можно сделать двумя способами:

1. Рекомендуемый вариант: самостоятельная установка Kubernetes кластера.  
   а. При помощи Terraform подготовить как минимум 3 виртуальных машины Compute Cloud для создания Kubernetes-кластера. Тип виртуальной машины следует выбрать самостоятельно с учётом требовании к производительности и стоимости. Если в дальнейшем поймете, что необходимо сменить тип инстанса, используйте Terraform для внесения изменений.  
   б. Подготовить [ansible](https://www.ansible.com/) конфигурации, можно воспользоваться, например [Kubespray](https://kubernetes.io/docs/setup/production-environment/tools/kubespray/)  
   в. Задеплоить Kubernetes на подготовленные ранее инстансы, в случае нехватки каких-либо ресурсов вы всегда можете создать их при помощи Terraform.
2. Альтернативный вариант: воспользуйтесь сервисом [Yandex Managed Service for Kubernetes](https://cloud.yandex.ru/services/managed-kubernetes)  
  а. С помощью terraform resource для [kubernetes](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster) создать **региональный** мастер kubernetes с размещением нод в разных 3 подсетях      
  б. С помощью terraform resource для [kubernetes node group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_node_group)
  
Ожидаемый результат:

1. Работоспособный Kubernetes кластер.
2. В файле `~/.kube/config` находятся данные для доступа к кластеру.
3. Команда `kubectl get pods --all-namespaces` отрабатывает без ошибок.
 
### Решение
![image](https://github.com/user-attachments/assets/def16287-9585-47ee-b10c-4b2b984beec1)  

```
acheusov2@acheusov2:~/Diplom/myapp/myapp$ docker build -t myapp:latest .
[+] Building 11.4s (9/9) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                       0.1s
 => => transferring dockerfile: 281B                                                                                                                       0.0s
 => [internal] load .dockerignore                                                                                                                          0.1s
 => => transferring context: 2B                                                                                                                            0.0s
 => [internal] load metadata for docker.io/library/nginx:1.23.3                                                                                            2.0s
 => [1/4] FROM docker.io/library/nginx:1.23.3@sha256:f4e3b6489888647ce1834b601c6c06b9f8c03dee6e097e13ed3e28c01ea3ac8c                                      5.1s
 => => resolve docker.io/library/nginx:1.23.3@sha256:f4e3b6489888647ce1834b601c6c06b9f8c03dee6e097e13ed3e28c01ea3ac8c                                      0.1s
 => => sha256:f4e3b6489888647ce1834b601c6c06b9f8c03dee6e097e13ed3e28c01ea3ac8c 1.86kB / 1.86kB                                                             0.0s
 => => sha256:ac232364af842735579e922641ae2f67d5b8ea97df33a207c5ea05f60c63a92d 7.66kB / 7.66kB                                                             0.0s
 => => sha256:557c9ede65655e5a70e4a32f1651638ea3bfb0802edd982810884602f700ba25 1.57kB / 1.57kB                                                             0.0s
 => => sha256:f1f26f5702560b7e591bef5c4d840f76a232bf13fd5aefc4e22077a1ae4440c7 31.41MB / 31.41MB                                                           1.4s
 => => sha256:84181e80d10e844350789d3324e848cf728df4f3d0f6c978789dd489f493934a 25.47MB / 25.47MB                                                           0.8s
 => => sha256:1ff0f94a80076ab49af75159e23f062a30a75d333a8e9c021bf39669230afcfe 625B / 625B                                                                 1.5s
 => => sha256:d4ceccbfc2696101c94fbf2149036e4ff815e4723e518721ff85105ce5aa8afc 1.41kB / 1.41kB                                                             1.8s
 => => extracting sha256:f1f26f5702560b7e591bef5c4d840f76a232bf13fd5aefc4e22077a1ae4440c7                                                                  1.5s
 => => sha256:e9427fcfa8642f8ddf5106f742a75eca0dbac676cf8145598623d04fa45dd74e 773B / 773B                                                                 1.9s
 => => sha256:d776269cad101c9f8e33e2baa0a05993ed0786604d86ea525f62d5d7ae7b9540 959B / 959B                                                                 2.0s
 => => extracting sha256:84181e80d10e844350789d3324e848cf728df4f3d0f6c978789dd489f493934a                                                                  0.6s
 => => extracting sha256:1ff0f94a80076ab49af75159e23f062a30a75d333a8e9c021bf39669230afcfe                                                                  0.0s
 => => extracting sha256:d776269cad101c9f8e33e2baa0a05993ed0786604d86ea525f62d5d7ae7b9540                                                                  0.0s
 => => extracting sha256:e9427fcfa8642f8ddf5106f742a75eca0dbac676cf8145598623d04fa45dd74e                                                                  0.0s
 => => extracting sha256:d4ceccbfc2696101c94fbf2149036e4ff815e4723e518721ff85105ce5aa8afc                                                                  0.0s
 => [internal] load build context                                                                                                                          0.1s
 => => transferring context: 798B                                                                                                                          0.0s
 => [2/4] ADD conf /etc/nginx                                                                                                                              2.8s
 => [3/4] ADD content /usr/share/nginx/html                                                                                                                0.3s
 => [4/4] RUN sed -i 's/{{VERSION}}/'"0.0.3"'/g' /usr/share/nginx/html/index.html                                                                          0.6s
 => exporting to image                                                                                                                                     0.2s
 => => exporting layers                                                                                                                                    0.2s
 => => writing image sha256:828186a42c678e3843836f43357acbddc524d8643b958a84a60c585201e06b14                                                               0.0s
 => => naming to docker.io/library/myapp:latest                                                                                                            0.0s
acheusov2@acheusov2:~/Diplom/myapp/myapp$ docker image ls
REPOSITORY                                                            TAG              IMAGE ID       CREATED          SIZE
myapp                                                                 latest           828186a42c67   14 seconds ago   142MB
```

[](https://hub.docker.com/repository/docker/andrewache/myapp1/general)  

---
### Создание тестового приложения

ДДля перехода к следующему этапу необходимо подготовить тестовое приложение, эмулирующее основное приложение разрабатываемое вашей компанией.

Способ подготовки:

1. Рекомендуемый вариант:  
   а. Создайте отдельный git репозиторий с простым nginx конфигом, который будет отдавать статические данные.  
   б. Подготовьте Dockerfile для создания образа приложения.  
2. Альтернативный вариант:  
   а. Используйте любой другой код, главное, чтобы был самостоятельно создан Dockerfile.

Ожидаемый результат:

1. Git репозиторий с тестовым приложением и Dockerfile.
2. Регистри с собранным docker image. В качестве регистри может быть DockerHub или [Yandex Container Registry](https://cloud.yandex.ru/services/container-registry), созданный также с помощью terraform.

### Решение

![image](https://github.com/user-attachments/assets/def16287-9585-47ee-b10c-4b2b984beec1)  

```
acheusov2@acheusov2:~/Diplom/myapp/myapp$ docker build -t myapp:latest .
[+] Building 11.4s (9/9) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                       0.1s
 => => transferring dockerfile: 281B                                                                                                                       0.0s
 => [internal] load .dockerignore                                                                                                                          0.1s
 => => transferring context: 2B                                                                                                                            0.0s
 => [internal] load metadata for docker.io/library/nginx:1.23.3                                                                                            2.0s
 => [1/4] FROM docker.io/library/nginx:1.23.3@sha256:f4e3b6489888647ce1834b601c6c06b9f8c03dee6e097e13ed3e28c01ea3ac8c                                      5.1s
 => => resolve docker.io/library/nginx:1.23.3@sha256:f4e3b6489888647ce1834b601c6c06b9f8c03dee6e097e13ed3e28c01ea3ac8c                                      0.1s
 => => sha256:f4e3b6489888647ce1834b601c6c06b9f8c03dee6e097e13ed3e28c01ea3ac8c 1.86kB / 1.86kB                                                             0.0s
 => => sha256:ac232364af842735579e922641ae2f67d5b8ea97df33a207c5ea05f60c63a92d 7.66kB / 7.66kB                                                             0.0s
 => => sha256:557c9ede65655e5a70e4a32f1651638ea3bfb0802edd982810884602f700ba25 1.57kB / 1.57kB                                                             0.0s
 => => sha256:f1f26f5702560b7e591bef5c4d840f76a232bf13fd5aefc4e22077a1ae4440c7 31.41MB / 31.41MB                                                           1.4s
 => => sha256:84181e80d10e844350789d3324e848cf728df4f3d0f6c978789dd489f493934a 25.47MB / 25.47MB                                                           0.8s
 => => sha256:1ff0f94a80076ab49af75159e23f062a30a75d333a8e9c021bf39669230afcfe 625B / 625B                                                                 1.5s
 => => sha256:d4ceccbfc2696101c94fbf2149036e4ff815e4723e518721ff85105ce5aa8afc 1.41kB / 1.41kB                                                             1.8s
 => => extracting sha256:f1f26f5702560b7e591bef5c4d840f76a232bf13fd5aefc4e22077a1ae4440c7                                                                  1.5s
 => => sha256:e9427fcfa8642f8ddf5106f742a75eca0dbac676cf8145598623d04fa45dd74e 773B / 773B                                                                 1.9s
 => => sha256:d776269cad101c9f8e33e2baa0a05993ed0786604d86ea525f62d5d7ae7b9540 959B / 959B                                                                 2.0s
 => => extracting sha256:84181e80d10e844350789d3324e848cf728df4f3d0f6c978789dd489f493934a                                                                  0.6s
 => => extracting sha256:1ff0f94a80076ab49af75159e23f062a30a75d333a8e9c021bf39669230afcfe                                                                  0.0s
 => => extracting sha256:d776269cad101c9f8e33e2baa0a05993ed0786604d86ea525f62d5d7ae7b9540                                                                  0.0s
 => => extracting sha256:e9427fcfa8642f8ddf5106f742a75eca0dbac676cf8145598623d04fa45dd74e                                                                  0.0s
 => => extracting sha256:d4ceccbfc2696101c94fbf2149036e4ff815e4723e518721ff85105ce5aa8afc                                                                  0.0s
 => [internal] load build context                                                                                                                          0.1s
 => => transferring context: 798B                                                                                                                          0.0s
 => [2/4] ADD conf /etc/nginx                                                                                                                              2.8s
 => [3/4] ADD content /usr/share/nginx/html                                                                                                                0.3s
 => [4/4] RUN sed -i 's/{{VERSION}}/'"0.0.3"'/g' /usr/share/nginx/html/index.html                                                                          0.6s
 => exporting to image                                                                                                                                     0.2s
 => => exporting layers                                                                                                                                    0.2s
 => => writing image sha256:828186a42c678e3843836f43357acbddc524d8643b958a84a60c585201e06b14                                                               0.0s
 => => naming to docker.io/library/myapp:latest                                                                                                            0.0s
acheusov2@acheusov2:~/Diplom/myapp/myapp$ docker image ls
REPOSITORY                                                            TAG              IMAGE ID       CREATED          SIZE
myapp                                                                 latest           828186a42c67   14 seconds ago   142MB
```

[Регистри с собранным docker image](https://hub.docker.com/repository/docker/andrewache/myapp1/general)  


---
### Подготовка cистемы мониторинга и деплой приложения

Уже должны быть готовы конфигурации для автоматического создания облачной инфраструктуры и поднятия Kubernetes кластера.  
Теперь необходимо подготовить конфигурационные файлы для настройки нашего Kubernetes кластера.

Цель:
1. Задеплоить в кластер [prometheus](https://prometheus.io/), [grafana](https://grafana.com/), [alertmanager](https://github.com/prometheus/alertmanager), [экспортер](https://github.com/prometheus/node_exporter) основных метрик Kubernetes.
2. Задеплоить тестовое приложение, например, [nginx](https://www.nginx.com/) сервер отдающий статическую страницу.

Способ выполнения:
1. Воспользоваться пакетом [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus), который уже включает в себя [Kubernetes оператор](https://operatorhub.io/) для [grafana](https://grafana.com/), [prometheus](https://prometheus.io/), [alertmanager](https://github.com/prometheus/alertmanager) и [node_exporter](https://github.com/prometheus/node_exporter). Альтернативный вариант - использовать набор helm чартов от [bitnami](https://github.com/bitnami/charts/tree/main/bitnami).

2. Если на первом этапе вы не воспользовались [Terraform Cloud](https://app.terraform.io/), то задеплойте и настройте в кластере [atlantis](https://www.runatlantis.io/) для отслеживания изменений инфраструктуры. Альтернативный вариант 3 задания: вместо Terraform Cloud или atlantis настройте на автоматический запуск и применение конфигурации terraform из вашего git-репозитория в выбранной вами CI-CD системе при любом комите в main ветку. Предоставьте скриншоты работы пайплайна из CI/CD системы.

Ожидаемый результат:
1. Git репозиторий с конфигурационными файлами для настройки Kubernetes.
2. Http доступ на 80 порту к web интерфейсу grafana.
3. Дашборды в grafana отображающие состояние Kubernetes кластера.
4. Http доступ на 80 порту к тестовому приложению.
5. Atlantis или terraform cloud или ci/cd-terraform

### Решение




---
### Установка и настройка CI/CD

Осталось настроить ci/cd систему для автоматической сборки docker image и деплоя приложения при изменении кода.

Цель:

1. Автоматическая сборка docker образа при коммите в репозиторий с тестовым приложением.
2. Автоматический деплой нового docker образа.

Можно использовать [teamcity](https://www.jetbrains.com/ru-ru/teamcity/), [jenkins](https://www.jenkins.io/), [GitLab CI](https://about.gitlab.com/stages-devops-lifecycle/continuous-integration/) или GitHub Actions.

Ожидаемый результат:

1. Интерфейс ci/cd сервиса доступен по http.
2. При любом коммите в репозиторие с тестовым приложением происходит сборка и отправка в регистр Docker образа.
3. При создании тега (например, v1.0.0) происходит сборка и отправка с соответствующим label в регистри, а также деплой соответствующего Docker образа в кластер Kubernetes.

### Решение



