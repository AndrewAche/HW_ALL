# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/1.2/1.2.md) к занятию  "Kubernetes. Базовые объекты K8S" - `Ачеусов Андрей`


### Задание 1. Создать Pod с именем hello-world  

***Решение:***  

1. Создать манифест (yaml-конфигурацию) Pod.  
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.  
3. Подключиться локально к Pod с помощью kubectl port-forward и вывести значение (curl или в браузере).  
 
![image](https://github.com/user-attachments/assets/4fa6f0fb-aec4-4a5f-ad86-8047f23f2d83)  

ПРОБЛЕМА:  
![image](https://github.com/user-attachments/assets/e9e89fec-c4c3-4045-afd7-1c95e61d1524)  
При выполнении команды:  microk8s kubectl describe pod :  
![image](https://github.com/user-attachments/assets/63eff682-1201-4a91-8762-7db2eb81f769)  



---


### Задание 2. Создать Service и подключить его к Pod  

***Решение:***  

1. Создать Pod с именем netology-web.  


2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.  


3. Создать Service с именем netology-svc и подключить к netology-web.  


4. Подключиться локально к Service с помощью kubectl port-forward и вывести значение (curl или в браузере).  



---
