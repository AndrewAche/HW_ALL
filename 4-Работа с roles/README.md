# Домашнее задание к занятию  "Ansible.Работа с roles" - `Ачеусов Андрей`

### Задание 1.1

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:

   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.13"
       name: clickhouse 
   ```

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/6472bf58-3190-4243-96e7-10790666a15c)


---

### Задание 1.2

2. При помощи `ansible-galaxy` скачайте себе эту роль.

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/d86cfbbc-4a85-419e-a581-366cc489e003)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/31e5ae34-5c95-4cb1-ad24-6085379a349e)


---

### Задание 1.3

3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/b49a2fec-2921-47c1-810d-75f5017d814a)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/ae2df07f-50f4-4960-9790-a46e9554cbc1)


---

### Задание 1.4

4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/c568e276-b666-4f57-b33a-e29b17955578)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/8c56e03b-a422-435b-92a5-d3073b92e126)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/5cd4909f-b18a-4577-a815-389165dba1cf)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/8cfbfdc2-8a86-462c-8e7b-1534dfdf960b)  



---

### Задание 1.5

5. Перенести нужные шаблоны конфигов в `templates`.



---

### Задание 1.6

6.  Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/ce0041bf-294f-417e-a8b0-24e230aa6446)  
По LightHouse выполнено аналогично.


---

### Задание 1.7

7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.

***Решение:***  
Выполнено аналогично  Vector.


---

### Задание 1.8

8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.

***Решение:***  
[Vector](https://github.com/AndrewAche/HW_ALL.git)
[Lighthouse](https://github.com/AndrewAche/Ansible-LightHouse-role.git)
[requirements.yml](https://github.com/AndrewAche/HW_ALL/blob/main/4-Работа%20с%20roles/requirements.yml)


---

### Задание 1.9

9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.

***Решение:***  



---

### Задание 1.10

10. Выложите playbook в репозиторий.

***Решение:***  



---

### Задание 1.11

11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

***Решение:***  



---
