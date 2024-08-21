# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/1.3/1.3.md) к занятию  "Запуск приложений в K8S" - `Ачеусов Андрей`


### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

***Решение:***  

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.  
![image](https://github.com/user-attachments/assets/f9d5a15e-136e-4ae7-bbcf-f9e7d27c44f2)  

![image](https://github.com/user-attachments/assets/14601ee4-2f8d-4afd-89cd-af1d99359bb7)  


2. После запуска увеличить количество реплик работающего приложения до 2.  
![image](https://github.com/user-attachments/assets/89e7bec0-6aec-4490-9e5c-a06457478905)  

3. Продемонстрировать количество подов до и после масштабирования.  
ДО:  
![image](https://github.com/user-attachments/assets/c5b67f0e-b6ba-44b8-8599-259e608e902e)  

ПОСЛЕ:  
![image](https://github.com/user-attachments/assets/87b743ee-b502-4ce3-b87d-e647e757835e)  


4. Создать Service, который обеспечит доступ до реплик приложений из п.1.  
![image](https://github.com/user-attachments/assets/be27aa7b-8e8c-4852-bd43-19c081b6793e)  


5. Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложений из п.1.  




---


### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

***Решение:***  

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.  


2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.  


3. Создать и запустить Service. Убедиться, что Init запустился.  


4. Продемонстрировать состояние пода до и после запуска сервиса.  



---
