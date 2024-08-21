# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/1.2/1.2.md) к занятию  "Kubernetes. Базовые объекты K8S" - `Ачеусов Андрей`


### Задание 1. Создать Pod с именем hello-world  

***Решение:***  

1. Создать манифест (yaml-конфигурацию) Pod.  
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.  
3. Подключиться локально к Pod с помощью kubectl port-forward и вывести значение (curl или в браузере).  
 
![image](https://github.com/user-attachments/assets/4fa6f0fb-aec4-4a5f-ad86-8047f23f2d83)  
![image](https://github.com/user-attachments/assets/b349e38d-2c5f-4bd4-95ee-3c22bef55e25)  
![image](https://github.com/user-attachments/assets/01ea0b70-8242-4375-84cf-30a644ddb179)  
![image](https://github.com/user-attachments/assets/da823eb2-d28d-43f5-890f-c989d39f4a94)  



---


### Задание 2. Создать Service и подключить его к Pod  

***Решение:***  

1. Создать Pod с именем netology-web.  
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.  
![image](https://github.com/user-attachments/assets/3fb3377b-07e3-4ffa-b77c-2bcea1be7581)  
![image](https://github.com/user-attachments/assets/fa4151bb-1e65-495d-8c10-ab9b80658f1e)  


4. Создать Service с именем netology-svc и подключить к netology-web.  
![image](https://github.com/user-attachments/assets/adb5e41b-a503-47e1-a988-9768420069b9)  
![image](https://github.com/user-attachments/assets/2cb98956-79a6-4227-a333-c8a07b9b2638)  


6. Подключиться локально к Service с помощью kubectl port-forward и вывести значение (curl или в браузере).  
![image](https://github.com/user-attachments/assets/0ba60e25-a4f9-4db6-b29b-3e675f3cbe59)  
![image](https://github.com/user-attachments/assets/65d9e4c0-f9af-45c8-bd60-50b4e1e31446)  


---
