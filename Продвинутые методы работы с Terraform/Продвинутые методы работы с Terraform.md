# Домашнее задание к занятию  "Управляющие конструкции в коде Terraform" - `Ачеусов Андрей`

### Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания ВМ с помощью remote-модуля.
2. Создайте одну ВМ, используя этот модуль. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```.

***Решение:***  
ВМ созданы:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/db9506ff-0db2-4ff2-8fd2-c87b5ad1a18d)  
Но откуда взять парроль, не понимаю... Он же нигде не задан, по ssh же подключение:   
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/4b4eea12-fbb4-4b93-ac9f-90f848cfcec7)



---


### Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev  
4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.vpc_dev.
6. Сгенерируйте документацию к модулю с помощью terraform-docs.    

***Решение:***  
В terraform concole вывод после выполнения пункта 3 задания:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/5d5f2cbc-3fd4-442e-a1ad-13b14c3c765d)  
В terraform concole вывод после выполнения пункта 5 задания и применения apply:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/691dc554-5aae-4b10-a947-11aaad56aa3d)  
Для генерации документации используется модуль terraform-docs и команда:  
>  docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.16.0 markdown /terraform-docs > doc.md
В итоге (приложил в файле doc.md):   
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/5e37ac92-88bb-4e05-82cc-58645f734ae2)  



---


### Задание 3

1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Изменений быть не должно.
Приложите список выполненных команд и скриншоты процессы.

***Решение:***  
<details><summary></summary>

   ```

  
```

</details>

---

