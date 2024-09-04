# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/1.4/1.4.md) к занятию  "Сетевое взаимодействие в K8S. Часть 1" - `Ачеусов Андрей`


### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

***Решение:***  

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.  
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.  
![image](https://github.com/user-attachments/assets/5960300b-aa53-42e4-a24a-5649213d8489)  
![image](https://github.com/user-attachments/assets/87153f20-5ca6-4165-ac94-3120ec39dac2)  



3. Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.  
4. Продемонстрировать доступ с помощью curl по доменному имени сервиса.  
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.  
![image](https://github.com/user-attachments/assets/ec0d4d34-5a33-4230-87a9-737327920944)  
![image](https://github.com/user-attachments/assets/82643d9a-875b-4635-ba35-958c27e05f3f)  

Манифест [deployment](https://github.com/AndrewAche/HW_ALL/blob/main/Kuber/3-net%201%20K8S/deployment3.yaml)

Манифест [service](https://github.com/AndrewAche/HW_ALL/blob/main/Kuber/3-net%201%20K8S/service.yaml)

---


### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

***Решение:***  

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.  
![image](https://github.com/user-attachments/assets/b81152be-0640-4792-9015-e6e7c90ae0bb)   


2. Продемонстрировать доступ с помощью браузера или curl с локального компьютера.  
![image](https://github.com/user-attachments/assets/579cf99b-61f8-4128-9bd4-0dcc59d095ce)   


3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.  
Манифест [service](https://github.com/AndrewAche/HW_ALL/tree/main/Kuber/3-net%201%20K8S)


---
