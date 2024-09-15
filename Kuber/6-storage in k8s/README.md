# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/2.1/2.1.md) к занятию  "Хранение в K8s. Часть 1" - `Ачеусов Андрей`


### Задание 1. Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными

***Решение:***  

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.  
![image](https://github.com/user-attachments/assets/4ec77908-57ee-49e2-84b5-be75078b3d0a)  

2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.  
![image](https://github.com/user-attachments/assets/a019e6ac-e15e-4ff7-ba4a-f15c67e1d206)  

3. Обеспечить возможность чтения файла контейнером multitool.  
![image](https://github.com/user-attachments/assets/eff777fd-df8c-46d9-af00-b66763e1dfab)  

4. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.  
![image](https://github.com/user-attachments/assets/be1823e4-7594-4b05-80ae-f06bace2db77)  

5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.  
См. выше  

---


### Задание 2. Создать DaemonSet приложения, которое может прочитать логи ноды

***Решение:***  

1. Создать DaemonSet приложения, состоящего из multitool.  

2. Обеспечить возможность чтения файла /var/log/syslog кластера MicroK8S.  

3. Продемонстрировать возможность чтения файла изнутри пода.  

4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.  
См. выше  

---
