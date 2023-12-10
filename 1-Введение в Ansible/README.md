# Домашнее задание к занятию  "Введение в Ansible" - `Ачеусов Андрей`

### Задание 1

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

***Решение:***  

Применяем команду ansible-playbook -i inventory/test.yml site.yml:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/07765706-78d3-4810-b149-3e3061382a4a)


---

### Задание 1.2

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

***Решение:***  

Проведена замена значения переменной в файле examp.yml:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/d295a104-375e-4a6b-9466-bbf51a8e5561)


---

### Задание 1.3

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

***Решение:***  

Подняты 2 машины:   
```
docker run --name ubuntu -d eclipse/ubuntu_python sleep 20000000
docker run --name centos7 -d centos:7 sleep 10000000
```
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/03a79f94-ea4a-4755-be8f-b3a88e33c907)  


---

### Задание 1.4

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

***Решение:***  

Команда: ansible-playbook -i inventory/prod.yml site.yml   
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/31d60f2a-a07a-4444-a24a-bc6c1af5cb7b)


---

### Задание 1.5

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

***Решение:***  

Достаточно переименовать значения в поле: "some_fact" файлов "examp.yml" для "deb" и "el"  

---

### Задание 1.6

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/ebe8dd40-5451-4c65-95d5-f36dc2347935)  

---

### Задание 1.7

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/1a3e7305-bc10-459a-b1ee-15dcdb1aa057)

---

### Задание 1.8

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/1d219e09-6b8b-47e0-b6f0-33c706dc870a)

---

### Задание 1.9

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/5bc0fb3d-fedc-4748-a9ca-8e55784dbbe3)

---

### Задание 1.10

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/01ce1299-78fa-40e9-84c1-2e53d152cd8c)


---

### Задание 1.11

11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/d5ff5c4c-1a46-4647-9285-40e0f32ade61)


---




