# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/2.2/2.2.md) к занятию  "Хранение в K8s. Часть 2" - `Ачеусов Андрей`


### Задание 1. Создать Deployment приложения, использующего локальный PV, созданный вручную  

***Решение:***  

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.  
[Deployment.yaml](https://github.com/AndrewAche/HW_ALL/blob/main/Kuber/7-storage%20in%20k8s%202/Deployment.yaml)  

3. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.  
![image](https://github.com/user-attachments/assets/c37ea75c-f98b-4722-b0f7-e748ed2b487d)  
![image](https://github.com/user-attachments/assets/7f5b2f7b-7ea2-46fa-8cbc-2d3a34d3224b)  

4. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории.  
![image](https://github.com/user-attachments/assets/cb4e1850-1a69-403c-847e-45403d1f591b)  

5. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.  
![image](https://github.com/user-attachments/assets/ab84cb99-d5a1-4462-9a70-6cf91e2db702)  
![image](https://github.com/user-attachments/assets/32abf462-1eeb-4618-bf5e-df0b4f326985)  
Файл сохранился на локальном диске ноды.  

6. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV. Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.  
![image](https://github.com/user-attachments/assets/7b247bbb-94c8-4a43-a896-4fd9dfdd704a)  
![image](https://github.com/user-attachments/assets/4b4da6da-e365-4e5d-a414-f97d2dc1b639)  
![image](https://github.com/user-attachments/assets/9d466196-ec31-4c8c-a9ef-9d18093fe275)  
Файл остался. Также при конфигурировании pv использовался режим ReclaimPolicy: Retain при котором "Retain - после удаления PV ресурсы из внешних провайдеров автоматически не удаляются". Даже после удаления pv файлы также останутся.  

8. Предоставить манифесты, а также скриншоты или вывод необходимых команд.  
См. выше  

---


### Задание 2. Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV  

***Решение:***  

1. Включить и настроить NFS-сервер на MicroK8S.  
![image](https://github.com/user-attachments/assets/0196d31d-32d6-421d-bb3c-dcaf966d6f15)  

2. Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.  
![image](https://github.com/user-attachments/assets/5ed7e8dd-546b-4259-bad6-90e2741a8ed2)  
!![image](https://github.com/user-attachments/assets/764a94f0-bb93-426c-9c1c-808a7af12bea)  

3. Продемонстрировать возможность чтения и записи файла изнутри пода.  
![image](https://github.com/user-attachments/assets/e5e59653-4806-48fe-96a0-21a4654005e3)  

4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.  
См. выше  

---
