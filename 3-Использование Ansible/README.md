# Домашнее задание к занятию  "Использование Ansible" - `Ачеусов Андрей`

### Задание 1.1

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.

***Решение:***  
[site.yml](https://github.com/AndrewAche/HW_ALL/blob/main/3-Использование%20Ansible/site.yml)


---

### Задание 1.2

2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
---

### Задание 1.3

3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.

***Решение:***  
[site.yml](https://github.com/AndrewAche/HW_ALL/blob/main/3-Использование%20Ansible/site.yml)


---

### Задание 1.4

4. Подготовьте свой inventory-файл `prod.yml`.

***Решение:***  
[prod.yml](https://github.com/AndrewAche/HW_ALL/blob/main/3-Использование%20Ansible/inventory/prod.yml)


---

### Задание 1.5

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/3dcaacd4-2d83-49b5-a465-a5aa6db05076)  
  
После исправления:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/19c6c5b2-cf08-4a28-88d9-8b61d0fcd501)  


---

### Задание 1.6

6.  Попробуйте запустить playbook на этом окружении с флагом `--check`.

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/6a76ecf3-ab64-4bda-beb6-7cf62c20bc08)


---

### Задание 1.7

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/526e5737-7c09-45ea-bad2-764b3bc19949)  


---

### Задание 1.8

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

***Решение:***  
...


---

### Задание 1.9

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.

***Решение:***  
### Playbook

   Playbook производит установку и настройку приложений для сбора, передачи и отображения логов на стэк серверов `clickhouse`, `vector` и `lighthouse`. Первый play объединяет последовательность задач по инсталяции Clickhouse. Блоку соответствует тэг `clickhouse`. Второй play объединяет последовательность задач по инсталяции Vector. Блоку соответствует тэг `vector`. Третий play объединяет последовательность задач по инсталяции Lighthouse. Блоку соответствует тэг `lighthouse`.

## Variables

   Значения переменных устанавливаются в файлах `vars.yml` в соответствующих директориях в `group_vars`. При помощи `vars.yml` задаются следующие параметры:
- `clickhouse_version`, `vector_version` - версии устанавливаемых приложений;
- `clickhouse_database_name` - имя базы данных в `clickhouse`;
- `clickhouse_create_table_name` - имя таблицы в `clickhouse`;
- `vector_config` - содержимое конфигурационного файла для приложения `vector`;
- `lighthouse_home_dir` - домашняя директория `lighthouse`;
- `nginx_config_dir` - директория расположения конфига `nginx`.

## Tags

Тэг `ping` - проверяет доступность серверов `clickhouse-01`,`vector-01`,`lighthouse-01`;
тэг `clickhouse` - позволяет производить отдельную настройку приложения `clickhouse`;
тэг `vector` - позволяет производить отдельную настройку приложения `vector`;
тэг `vector_config` - позволяет производить изменение в конфиге приложения `vector`;
тэг `lighthouse` - позволяет производить отдельную настройку приложения `lighthouse` на одноименных серверах.


---

### Задание 1.10

10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

***Решение:***  
[site.yml](https://github.com/AndrewAche/HW_ALL/blob/main/3-Использование%20Ansible/site.yml)


---
