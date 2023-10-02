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

Допущение: в ДЗ сказано "Предоставьте привелегии пользователю `test` на операции SELECT базы `test_db`" - в моей случае использовалась БД `netology_db`, т.к. изначально дал ей такое название.  

Ответ к заданию со всеми используемыми командами (как можно заметить, ID контецнера поменялось, т.к. продолжил ДЗ в другой день):  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/f02d06d3-9db1-4306-982f-d63f1ebd052b)  


---



### Задание 3

Используемый `engine` - InnoDB:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/bab6836c-0fc5-4da9-a003-0ab0dc8ee565)  

Изменение движка на `MyISAM` и обратно:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/5d3de4b9-2dff-4869-bd87-1f11de21c4d1)  


---



### Задание 4

Измененный файл `my.cnf`:  
```
bash-4.4# cat /etc/my.cnf
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/8.0/en/server-configuration-defaults.html

[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M
#
# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
# log_bin
#
# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M

# Remove leading # to revert to previous value for default_authentication_plugin,
# this will increase compatibility with older clients. For background, see:
# https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_default_authentication_plugin
# default-authentication-plugin=mysql_native_password
skip-host-cache
skip-name-resolve
datadir=/var/lib/mysql
socket=/var/run/mysqld/mysqld.sock
secure-file-priv=/var/lib/mysql-files
user=mysql

innodb_flush_log_at_trx_commit = 0
innodb_file_per_table = ON
innodb_buffer_pool_size =  300M
innodb_log_buffer_size = 1M
innodb_file_format = Barracuda
innodb_log_file_size = 100M


pid-file=/var/run/mysqld/mysqld.pid
[client]
socket=/var/run/mysqld/mysqld.sock

!includedir /etc/mysql/conf.d/
```

---
