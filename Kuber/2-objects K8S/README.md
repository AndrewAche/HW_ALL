# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/1.2/1.2.md) к занятию  "Kubernetes. Базовые объекты K8S" - `Ачеусов Андрей`


### Задание 1. Создать Pod с именем hello-world  

***Решение:***  

1. Создать манифест (yaml-конфигурацию) Pod.  


2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.  


3. Подключиться локально к Pod с помощью kubectl port-forward и вывести значение (curl или в браузере).  
 
ОШИБКИ:  
![image](https://github.com/user-attachments/assets/c51476cf-1799-4181-98af-43655f1b2ea0)  

![image](https://github.com/user-attachments/assets/c0ceca52-66e9-4254-945a-8e1fc811409f)  


---


### Задание 2. Создать Service и подключить его к Pod  

***Решение:***  

1. Создать Pod с именем netology-web.  


2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.  


3. Создать Service с именем netology-svc и подключить к netology-web.  


4. Подключиться локально к Service с помощью kubectl port-forward и вывести значение (curl или в браузере).  



---
