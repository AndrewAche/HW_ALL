# Домашнее задание к занятию  06_03 "MySQL" - `Ачеусов Андрей`

### Задание 1

Поднял контенер:  
`sudo docker run --network host -e MYSQL_ROOT_PASSWORD=mysql -ti -v volume:/etc/mysql/ mysql:8.0`  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/f6abee34-2605-4dac-8509-9458c1d4b832)  

Скопировал бэкап в контейнер, создал БД netology_db, восстановил в неё бэкап:  
`sudo docker cp test_dump.sql 6edbb7ef621e:/etc/mysql/`  
`mysql> CREATE DATABASE netology_db;`  
`mysql -u root -p netology_db < /etc/mysql/test_dump.sql`  
Тут же указан список таблиц:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/5b46619f-bac1-4e22-aa82-a214420c70d3)  


Информация по версии сервера:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/20552d02-406d-4f9e-b78a-3911a11c9003)  


Запрос кол-ва строк с `price` > 300  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/9d35ac68-21fc-4f2e-bad5-a74863ff7100)  



---



### Задание 2



---



### Задание 3



---



### Задание 4



---
