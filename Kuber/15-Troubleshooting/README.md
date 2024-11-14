# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/3.5/3.5.md) к занятию «Troubleshooting»- `Ачеусов Андрей`


### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить  
1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```
2. Выявить проблему и описать.
3. Исправить проблему, описать, что сделано.
4. Продемонстрировать, что проблема решена.


***Решение:***  

После запуска команды:  
![image](https://github.com/user-attachments/assets/0b2f2f1f-4ff9-4a07-a47b-fd3c2cd65d5a)  
Проблема в отсутствии namespaces, создаю их и запускаю заново:  
![image](https://github.com/user-attachments/assets/160808cb-56fe-4646-898c-6137c6e4d39c)  
![image](https://github.com/user-attachments/assets/410c3fc4-d8ff-4f70-8557-1b478a343953)  
![image](https://github.com/user-attachments/assets/ca0a31ce-940d-4b54-b05a-15f02f4c9a85)  
IP адреса pod-ов:  
![image](https://github.com/user-attachments/assets/399e738d-1f1f-4a08-b976-71bae966a41c)  
Захожу в поды и пингую ip 10.1.185.103 data-ноды (всё Ок):  
![image](https://github.com/user-attachments/assets/83b7fa87-8f6e-489e-ad49-53ccc7dd1c23)  
![image](https://github.com/user-attachments/assets/9a6418db-56ff-45f9-9d4f-2ac12f821b1c)  
Захожу в логи:  
![image](https://github.com/user-attachments/assets/f8a533b9-c6dc-49b8-a0ee-dda1ae388c95)  
![image](https://github.com/user-attachments/assets/c8c21806-f74a-4fab-a975-8a2bb3c42d4e)  
Проблема в том, что контейнеры не знают dns имя "auth-db"  
Необходимо прописать в dns запись "auth-db". Pod-ы в разных namespace, поэтому pod-ы из web не могут достучаться до pod-a из data.  
В конфиге вношу изменения:  
![image](https://github.com/user-attachments/assets/5cc45beb-98da-49d0-9cc3-b630b7875cf6)

```bash
# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.
#
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "2"
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"apps/v1","kind":"Deployment","metadata":{"annotations":{},"name":"web-consumer","namespace":"web"},"spec":{"replicas":2,"selector":{"matchLabels":{"app":"web-consumer"}},"template":{"metadata":{"labels":{"app":"web-con>  creationTimestamp: "2024-11-14T22:32:58Z"
  generation: 2
  name: web-consumer
  namespace: web
  resourceVersion: "3011947"
  uid: 0c0d5907-99ad-42dc-bbeb-68db289ea0ab
spec:
  progressDeadlineSeconds: 600
  replicas: 2
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: web-consumer
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: web-consumer
    spec:
      containers:
      - command:
        - sh
        - -c
        - while true; do curl auth-db.data; sleep 5; done
        image: radial/busyboxplus:curl
        imagePullPolicy: IfNotPresent
        name: busybox
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
status:
  availableReplicas: 2
  conditions:
  - lastTransitionTime: "2024-11-14T22:33:03Z"
    lastUpdateTime: "2024-11-14T22:33:03Z"
    message: Deployment has minimum availability.
    reason: MinimumReplicasAvailable
    status: "True"
    type: Available
  - lastTransitionTime: "2024-11-14T22:32:58Z"
    lastUpdateTime: "2024-11-14T22:50:42Z"
    message: ReplicaSet "web-consumer-648bd97449" has successfully progressed.
    reason: NewReplicaSetAvailable
    status: "True"
    type: Progressing
  observedGeneration: 2
  readyReplicas: 2
  replicas: 2
  updatedReplicas: 2
```
Исправлено:  
![image](https://github.com/user-attachments/assets/da1c1909-7b7e-41ad-81f0-dd0905212f51)  
![image](https://github.com/user-attachments/assets/b11def3c-6717-486b-99fe-dabac5c9b74b)  


---
