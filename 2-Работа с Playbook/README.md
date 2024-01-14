# Домашнее задание к занятию  "Введение в Ansible" - `Ачеусов Андрей`

### Задание 1.1

1. Подготовьте свой inventory-файл `prod.yml`.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/d31d7771-4981-4445-877e-3ba21e56c03d)


---

### Задание 1.2

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!

***Решение:***  

Получившийся Playbook прилагаю в файле [site.yml](https://github.com/AndrewAche/HW_ALL/blob/main/2-Работа%20с%20Playbook/site.yml)  

---

### Задание 1.3

3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
---

### Задание 1.4

4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
---

### Задание 1.5

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

***Решение:***  

Ошибок не возникло:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/1f0f716d-6705-46e4-8d08-a4167175886c)


---

### Задание 1.6

6.  Попробуйте запустить playbook на этом окружении с флагом `--check`.

***Решение:***  
Обновление от 14.01.24: переделал полностью Плейбук под Дебиан - в этом и состоял корень всех проблем с домашним заданием :)  
В ИТОГЕ:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/de1ac73f-8b9a-4a7b-b7a9-f489f001f34d)  


---

### Задание 1.7

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

***Решение:***  
Изменения были произведены, просто выполнял много раз перед тем как сделать скрин, поэтому "changed=0"  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/29195648-5dab-4796-8ada-e4004be8ad23)


---

### Задание 1.8

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/1be74756-0f8e-4346-a3f6-885922ce95aa)


---

### Задание 1.9

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8


---

### Задание 1.10

10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

***Решение:***  

[site2.yml](https://github.com/AndrewAche/HW_ALL/blob/main/2-Работа%20с%20Playbook/site2.yml)
[vars.yml](https://github.com/AndrewAche/HW_ALL/blob/main/2-Работа%20с%20Playbook/vars.yml)
[prod.yml](https://github.com/AndrewAche/HW_ALL/blob/main/2-Работа%20с%20Playbook/prod.yml)


---

