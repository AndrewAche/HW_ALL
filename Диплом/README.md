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
![image](https://github.com/user-attachments/assets/27407fc5-78f9-4664-bee1-44051f704110)   
   
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
Создал Kubernetes кластер на базе предварительно созданной инфраструктуры. Обеспечил доступ к ресурсам из Интернета.  

Для выполнения данного задания использовал Kubespray - git clone https://github.com/kubernetes-sigs/kubespray.git  

При создании инфраструктуры был использован [hosts.yaml](https://github.com/AndrewAche/HW_ALL/blob/main/Диплом/kubespray/hosts.yaml)

1. Работоспособный Kubernetes кластер.  

```
acheusov2@acheusov2:~/Diplom/cloud-terraform/kubespray$ ansible-playbook -i inventory/mycluster/hosts.yaml cluster.yml -b

PLAY [Check Ansible version] **********************************************************************************************

TASK [Check 2.15.4 <= Ansible version < 2.17.0] ***************************************************************************
ok: [node-0] => {
    "changed": false,
    "msg": "All assertions passed"
}

TASK [Check that python netaddr is installed] *****************************************************************************
ok: [node-0] => {
    "changed": false,
    "msg": "All assertions passed"
}

TASK [Check that jinja is not too old (install via pip)] ******************************************************************
ok: [node-0] => {
    "changed": false,
    "msg": "All assertions passed"
}
[WARNING]: Could not match supplied host pattern, ignoring: kube-master

PLAY [Add kube-master nodes to kube_control_plane] ************************************************************************
skipping: no hosts matched
[WARNING]: Could not match supplied host pattern, ignoring: kube-node

PLAY [Add kube-node nodes to kube_node] ***********************************************************************************
skipping: no hosts matched
[WARNING]: Could not match supplied host pattern, ignoring: k8s-cluster

PLAY [Add k8s-cluster nodes to k8s_cluster] *******************************************************************************
skipping: no hosts matched
[WARNING]: Could not match supplied host pattern, ignoring: calico-rr

PLAY [Add calico-rr nodes to calico_rr] ***********************************************************************************
skipping: no hosts matched
[WARNING]: Could not match supplied host pattern, ignoring: no-floating

PLAY [Add no-floating nodes to no_floating] *******************************************************************************
skipping: no hosts matched
[WARNING]: Could not match supplied host pattern, ignoring: bastion

PLAY [Install bastion ssh config] *****************************************************************************************
skipping: no hosts matched

PLAY [Bootstrap hosts for Ansible] ****************************************************************************************
[WARNING]: raw module does not support the environment keyword
[WARNING]: raw module does not support the environment keyword
[WARNING]: raw module does not support the environment keyword

TASK [bootstrap-os : Fetch /etc/os-release] *******************************************************************************
ok: [node-0]
ok: [node-2]
ok: [node-1]

TASK [bootstrap-os : Create remote_tmp for it is used by another module] **************************************************
ok: [node-0]
ok: [node-2]
ok: [node-1]

TASK [bootstrap-os : Gather facts] ****************************************************************************************
ok: [node-2]
ok: [node-1]
ok: [node-0]

TASK [bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora)] ***
ok: [node-2]
ok: [node-1]
ok: [node-0]

TASK [bootstrap-os : Ensure bash_completion.d folder exists] **************************************************************
ok: [node-0]
ok: [node-2]
ok: [node-1]

PLAY [Gather facts] ***********************************************************************************************
TASK [network_plugin/calico : Check vars defined correctly] ***************************************************************
ok: [node-0] => {
    "changed": false,
    "msg": "All assertions passed"
}

TASK [network_plugin/calico : Check calico network backend defined correctly] *********************************************
ok: [node-0] => {
    "changed": false,
    "msg": "All assertions passed"
}

TASK [network_plugin/calico : Check ipip and vxlan mode defined correctly] ************************************************
ok: [node-0] => {
    "changed": false,
    "msg": "All assertions passed"
}

TASK [network_plugin/calico : Check ipip and vxlan mode if simultaneously enabled] ****************************************
ok: [node-0] => {
    "changed": false,
    "msg": "All assertions passed"
}

TASK [network_plugin/calico : Get Calico default-pool configuration] ******************************************************
ok: [node-0]

TASK [network_plugin/calico : Set calico_pool_conf] ***********************************************************************
ok: [node-0]

TASK [network_plugin/calico : Check if inventory match current cluster configuration] *************************************
ok: [node-0] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP ****************************************************************************************************************
node-0                     : ok=655  changed=24   unreachable=0    failed=0    skipped=1142 rescued=0    ignored=1   
node-1                     : ok=449  changed=10   unreachable=0    failed=0    skipped=705  rescued=0    ignored=1   
node-2                     : ok=449  changed=10   unreachable=0    failed=0    skipped=701  rescued=0    ignored=1   

acheusov2@acheusov2:~/Diplom/cloud-terraform/kubespray$
```

2. Kubernetes кластер  

```
acheusov2@acheusov2:~/Diplom/cloud-terraform/kubespray$ kubectl get nodes
NAME     STATUS   ROLES           AGE   VERSION
node-0   Ready    control-plane   21m   v1.29.5
node-1   Ready    <none>          20m   v1.29.5
node-2   Ready    <none>          20m   v1.29.5
acheusov2@acheusov2:~/Diplom/cloud-terraform/kubespray$ kubectl get pods --all-namespaces
NAMESPACE     NAME                                       READY   STATUS    RESTARTS   AGE
kube-system   calico-kube-controllers-68485cbf9c-vxx9l   1/1     Running   0          17m
kube-system   calico-node-8nzqm                          1/1     Running   0          18m
kube-system   calico-node-kzdq5                          1/1     Running   0          18m
kube-system   calico-node-wbxw2                          1/1     Running   0          18m
kube-system   coredns-69db55dd76-clths                   1/1     Running   0          16m
kube-system   coredns-69db55dd76-tvkh2                   1/1     Running   0          16m
kube-system   dns-autoscaler-6f4b597d8c-jj2vz            1/1     Running   0          16m
kube-system   kube-apiserver-node-0                      1/1     Running   2          19m
kube-system   kube-controller-manager-node-0             1/1     Running   2          19m
kube-system   kube-proxy-m28z6                           1/1     Running   0          3m3s
kube-system   kube-proxy-rslls                           1/1     Running   0          3m3s
kube-system   kube-proxy-xpck8                           1/1     Running   0          3m3s
kube-system   kube-scheduler-node-0                      1/1     Running   1          19m
kube-system   nginx-proxy-node-1                         1/1     Running   0          19m
kube-system   nginx-proxy-node-2                         1/1     Running   0          19m
kube-system   nodelocaldns-7g58k                         1/1     Running   0          16m
kube-system   nodelocaldns-cszrn                         1/1     Running   0          16m
kube-system   nodelocaldns-kqkgb                         1/1     Running   0          16m
 
```

3. Содержание файла `~/.kube/config` :     
```
acheusov2@acheusov2:~/Diplom/src/terraform$ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://84.201.158.176:6443
  name: cluster.local
contexts:
- context:
    cluster: cluster.local
    user: kubernetes-admin
  name: kubernetes-admin@cluster.local
current-context: kubernetes-admin@cluster.local
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    client-certificate-data: DATA+OMITTED
    client-key-data: DATA+OMITTED

```


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

  * [Регистри с собранным docker image](https://hub.docker.com/repository/docker/andrewache/myapp1/general)  
  * [Git репозиторий с тестовым приложением и Dockerfile](https://github.com/AndrewAche/myapp)

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

1. Git репозиторий с конфигурационными файлами для настройки Kubernetes.  
Кластер prometheus, grafana, alertmanager, экспортер основных метрик Kubernetes задеплоил с помощью helm charts  

Подготовка cистемы мониторинга  
```
root@node-0:/home/ubuntu$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
root@node-0:/home/ubuntu$ chmod 700 get_helm.sh
root@node-0:/home/ubuntu$ ./get_helm.sh
Helm v3.17.2 is available. Changing from version v3.16.1.
Downloading https://get.helm.sh/helm-v3.17.2-linux-amd64.tar.gz
Verifying checksum... Done.
Preparing to install helm into /usr/local/bin
helm installed into /usr/local/bin/helm
root@node-0:/home/ubuntu$ 
root@node-0:/home/ubuntu$ kubectl create namespace monitoring
namespace/monitoring created
root@node-0:/home/ubuntu$ sudo helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
"prometheus-community" has been added to your repositories
root@node-0:/home/ubuntu$ sudo helm install stable prometheus-community/kube-prometheus-stack --namespace=monitoring
NAME: stable
LAST DEPLOYED: Sat Apr 5 14:11:41 2025
NAMESPACE: monitoring
STATUS: deployed
REVISION: 1
NOTES:
kube-prometheus-stack has been installed. Check its status by running:
  kubectl --namespace monitoring get pods -l "release=stable"

Visit https://github.com/prometheus-operator/kube-prometheus for instructions on how to create & configure Alertmanager and Prometheus instances using the Operator.
root@node-0:/home/ubuntu$

```
```
root@node-0:/home/ubuntu$ kubectl get all -n monitoring
NAME                                                         READY   STATUS    RESTARTS   AGE
pod/alertmanager-stable-kube-prometheus-sta-alertmanager-0   2/2     Running   0          37s
pod/prometheus-stable-kube-prometheus-sta-prometheus-0       2/2     Running   0          37s
pod/stable-grafana-785b7999d-spl28                           3/3     Running   0          52s
pod/stable-kube-prometheus-sta-operator-f844d969f-gqkmh      1/1     Running   0          52s
pod/stable-kube-state-metrics-5477f4cb54-mnq5j               1/1     Running   0          52s
pod/stable-prometheus-node-exporter-65kbk                    1/1     Running   0          52s
pod/stable-prometheus-node-exporter-fqrzs                    1/1     Running   0          52s
pod/stable-prometheus-node-exporter-jvbwv                    1/1     Running   0          52s

NAME                                              TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
service/alertmanager-operated                     ClusterIP   None            <none>        9093/TCP,9094/TCP,9094/UDP   37s
service/prometheus-operated                       ClusterIP   None            <none>        9090/TCP                     37s
service/stable-grafana                            ClusterIP   10.233.16.168   <none>        80/TCP                       52s
service/stable-kube-prometheus-sta-alertmanager   ClusterIP   10.233.13.148   <none>        9093/TCP,8080/TCP            52s
service/stable-kube-prometheus-sta-operator       ClusterIP   10.233.49.191   <none>        443/TCP                      52s
service/stable-kube-prometheus-sta-prometheus     ClusterIP   10.233.37.107   <none>        9090/TCP,8080/TCP            52s
service/stable-kube-state-metrics                 ClusterIP   10.233.55.210   <none>        8080/TCP                     52s
service/stable-prometheus-node-exporter           ClusterIP   10.233.13.252   <none>        9100/TCP                     52s

NAME                                             DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
daemonset.apps/stable-prometheus-node-exporter   3         3         3       3            3           kubernetes.io/os=linux   52s

NAME                                                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/stable-grafana                        1/1     1            1           52s
deployment.apps/stable-kube-prometheus-sta-operator   1/1     1            1           52s
deployment.apps/stable-kube-state-metrics             1/1     1            1           52s

NAME                                                            DESIRED   CURRENT   READY   AGE
replicaset.apps/stable-grafana-785b7999d                        1         1         1       52s
replicaset.apps/stable-kube-prometheus-sta-operator-f844d969f   1         1         1       52s
replicaset.apps/stable-kube-state-metrics-5477f4cb54            1         1         1       52s

NAME                                                                    READY   AGE
statefulset.apps/alertmanager-stable-kube-prometheus-sta-alertmanager   1/1     37s
statefulset.apps/prometheus-stable-kube-prometheus-sta-prometheus       1/1     37s
root@node-0:/home/ubuntu$
```


2. Http доступ на 80 порту к web интерфейсу grafana.  
Чтобы подключаться к серверу извне перенастроим сервисы(svc) созданные для kube-prometheus-stack.  
```
root@node-0:/home/ubuntu$ kubectl edit svc stable-kube-prometheus-sta-prometheus -n monitoring
service/stable-kube-prometheus-sta-prometheus edited
root@node-0:/home/ubuntu# kubectl edit svc stable-grafana -n monitoring
service/stable-grafana edited

root@node-0:/home/ubuntu$ kubectl get svc -n monitoring
NAME                                      TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                         AGE
alertmanager-operated                     ClusterIP   None            <none>        9093/TCP,9094/TCP,9094/UDP      42m
prometheus-operated                       ClusterIP   None            <none>        9090/TCP                        42m
stable-grafana                            NodePort    10.233.16.168   <none>        80:32680/TCP                    42m
stable-kube-prometheus-sta-alertmanager   ClusterIP   10.233.13.148   <none>        9093/TCP,8080/TCP               42m
stable-kube-prometheus-sta-operator       ClusterIP   10.233.49.191   <none>        443/TCP                         42m
stable-kube-prometheus-sta-prometheus     NodePort    10.233.37.107   <none>        9090:30643/TCP,8080:30217/TCP   42m
stable-kube-state-metrics                 ClusterIP   10.233.55.210   <none>        8080/TCP                        42m
stable-prometheus-node-exporter           ClusterIP   10.233.13.252   <none>        9100/TCP                        42m
root@node-0:/home/ubuntu$
```


3. Дашборды в grafana отображающие состояние Kubernetes кластера.  
![image](https://github.com/user-attachments/assets/4f59682c-13ce-4504-8b2b-61316ba6efcc)  
  
![image](https://github.com/user-attachments/assets/af233f84-a972-46ab-9f0f-5b18fc85a884)  


5. Http доступ на 80 порту к тестовому приложению.   
![image](https://github.com/user-attachments/assets/dca45968-4e8e-4ae1-b527-83381f4fb193)  


```
root@node-0:/home/ubuntu/myapp$ kubectl get pods,svc,deployment  -n monitoring
NAME                                 READY   STATUS    RESTARTS   AGE
pod/myapp-687d8adf29f4-qrpfb           1/1     Running   0          51m

NAME                               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                         AGE
service/myapp-service              dePort     10.233.52.164    <none>        80:30080/TCP                    10h

NAME                                                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/myapp                                 1/1     1            1           53m
root@node-0:/home/ubuntu/myapp$
```




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
Для автоматической сборки docker image и деплоя приложения при изменении кода будет использоваться Github actions   

Для работы ci-cd в github action требуются учетные данные.  

Поэтому создаем в Dockerhub секретный токен.  

Затем создаем в github секреты для доступа к DockerHub.  

KUBE_CONFIG_DATA

DOCKERHUB_TOKEN

DOCKERHUB_USERNAME


1. Интерфейс ci/cd сервиса доступен по http:  
![image](https://github.com/user-attachments/assets/31ccd043-7270-4417-8360-7011826e0b24)
[Ссылка](https://github.com/AndrewAche/myapp/actions)  

  
3. При любом коммите в репозиторие с тестовым приложением происходит сборка и отправка в регистр Docker образа.  
[production_deployment.yml](https://github.com/AndrewAche/myapp/blob/main/.github/workflows/production_deployment.yml)  
```
name: myapp
on:
  push:
    branches:
      - main
    tags:
      - 'v*'
env:
  IMAGE_TAG: andrewache/myapp
  RELEASE_NAME: myapp
  NAMESPACE: monitoring

jobs:
  build-and-push:
    name: Build Docker image
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Setup Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Extract version from commit messages
        run: |
          VERSION=$(git log -1 --pretty=format:%B)
          if [[ ! -z "$VERSION" ]]; then
            echo "VERSION=$VERSION" >> $GITHUB_ENV
          else
            echo "No version found in the commit message"
            exit 1
          fi

      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ env.IMAGE_TAG }}:${{ env.VERSION }}

  deploy:
    needs: build-and-push
    name: Deploy to Kubernetes
    if: startsWith(github.ref, 'refs/heads/main') || startsWith(github.ref, 'refs/tags/v')
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Kubernetes
        uses: azure/setup-kubectl@v1
        with:
          version: 'v1.21.0'


#      - name: version from commit messages
#        run: |
#          COMMIT_MESSAGE=$(git log -1 --pretty=format%B)
#          if [[ "$COMMIT_MESSAGE" == v* ]]; then
#            echo "DEPLOY=true" >> $GITHUB_ENV
#          else 
#           echo "DEPLOY=false" >> $GITHUB_ENV
#          fi
 
      - name: Extract version from commit messages
        run: |
          VERSION=$(git log -1 --pretty=format:%B)
          if [[ ! -z "$VERSION" ]]; then
            echo "VERSION=$VERSION" >> $GITHUB_ENV
          else
            echo "No version found in the commit message"
            exit 1
          fi

      - name: Replace image tag in deploy.yaml
        if: env.DEPLOY == 'false'
       
        run: |
          sed -i "s|image: andrewache/myapp:.*|image: ${{ env.IMAGE_TAG }}|" ./myapp/deploy.yaml
        env:
          IMAGE_TAG: andrewache/myapp:${{ env.VERSION }}
      
      - name: Create kubeconfig
        run: |
          mkdir -p $HOME/.kube/
      - name: Authenticate to Kubernetes cluster
        env:
          KUBE_CONFIG_DATA: ${{ secrets.KUBE_CONFIG_DATA }}
        run: |
          echo "${KUBE_CONFIG_DATA}" | base64 --decode > ${HOME}/.kube/config
      - name: Apply Kubernetes manifests
        run: |
          kubectl apply -f ./myapp/deploy.yaml 
```

4. При создании тега (например, v1.0.0) происходит сборка и отправка с соответствующим label в регистри, а также деплой соответствующего Docker образа в кластер Kubernetes.   
![image](https://github.com/user-attachments/assets/66eaf9be-329a-4e85-b08b-c34c7d3de3bf)  
[Ссылка](https://hub.docker.com/repository/docker/andrewache/myapp/general)  

![image](https://github.com/user-attachments/assets/7c722c41-eb49-4da9-8662-c06e98938e4a)  




