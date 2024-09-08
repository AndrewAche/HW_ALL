# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/1.5/1.5.md) к занятию  "Сетевое взаимодействие в K8S. Часть 2" - `Ачеусов Андрей`


### Задание 1. Создать Deployment приложений backend и frontend

***Решение:***  

1. Создать Deployment приложения frontend из образа nginx с количеством реплик 3 шт.  
![image](https://github.com/user-attachments/assets/614244c5-efce-4d7b-bd70-f963f495c850)  

2. Создать Deployment приложения backend из образа multitool.  
![image](https://github.com/user-attachments/assets/1cf204be-efcb-4f63-a0b0-955bb4626c77)  

3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера.  
![image](https://github.com/user-attachments/assets/147bc34e-3324-45e0-91b8-94d90f60c024)  

4. Продемонстрировать, что приложения видят друг друга с помощью Service.  
![image](https://github.com/user-attachments/assets/b7ac772a-9629-49fe-b73f-6ed708fa71fb)  
![image](https://github.com/user-attachments/assets/a0954095-6aa0-4dcc-98e8-4a8427125ba0)  

6. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.  
См. выше   

---


### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

***Решение:***  

1. Включить Ingress-controller в MicroK8S.  
![image](https://github.com/user-attachments/assets/e4bf7f44-b803-4418-bfe7-21736f03265f)  

2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался frontend а при добавлении /api - backend.  
![image](https://github.com/user-attachments/assets/ddfe141f-d7d9-4551-a6da-841e394b0d4a)  

3. Продемонстрировать доступ с помощью браузера или curl с локального компьютера.  
![image](https://github.com/user-attachments/assets/5a29a92d-6b80-4984-91d1-618e39eb4dd9)  
![image](https://github.com/user-attachments/assets/6a0c7f31-0743-4794-bb24-941c0485768f)  

4. Предоставить манифесты и скриншоты или вывод команды п.2.  
См. выше   

---
