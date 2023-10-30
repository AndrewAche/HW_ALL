# Домашнее задание к занятию  "Введение в Terraform" - `Ачеусов Андрей`

### Задание 0.1

Скачайте и установите Terraform версии =1.5.5 (версия 1.6 может вызывать проблемы с Яндекс провайдером) . Приложите скриншот вывода команды terraform --version.  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/0e525ec0-7dbf-49ef-975d-abdb3b859b3c)  



---



### Задание 1
1.  Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.  
`git clone https://github.com/netology-code/ter-homeworks/tree/main/01/src`  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/387026ab-bf51-420b-9b4e-8f29ccfbf1eb)  

2.  Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?  
В файле `personal.auto.tfvars`  

3.  Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/baa2a4df-6ea2-4145-8180-9be8fa879650)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/fafd1d89-b87c-4174-b710-5a20d437be3b)  


4.  Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду `terraform validate`. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.  
Ошибка 1 состоит в отсутствие имени для ресурса "docker_image", т.е. указан только тип ресурса, без "name", что некорректно  
Ошибка 2 состоит в неправльном имени ресурса = "1nginx"  
Ошибка 3 состоит в неправльной ссылке: "random_string_FAKE.resulT" - необходимо убрать FAKE, т.к. это нигде не заявлено и "resulT" заменить на "result"  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/49e6295f-70d1-44ed-ba21-9b8abe4293a1)  


6.  Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды `docker ps`.  
Скорректированная конфигурация:  
`... resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx_1" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 8000
  }
}`    

Результат `docker ps`:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/60bcb165-9452-447b-bb2b-80c6b8b86544)  


7.  Замените имя docker-контейнера в блоке кода на `hello_world`. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду `terraform apply -auto-approve`. Объясните своими словами, в чём может быть опасность применения ключа `-auto-approve`. В качестве ответа дополнительно приложите вывод команды `docker ps`.  


8.  Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.  


9.  Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ обязательно подкрепите строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )  



---
