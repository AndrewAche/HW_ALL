# [Домашнее задание](https://github.com/netology-code/mnt-homeworks/blob/MNT-video/09-ci-06-gitlab/README.md) к занятию  "Gitlab" - `Ачеусов Андрей`



## Основная часть

### DevOps

В репозитории содержится код проекта на Python. Проект — RESTful API сервис. Ваша задача — автоматизировать сборку образа с выполнением python-скрипта:

1. Образ собирается на основе [centos:7](https://hub.docker.com/_/centos?tab=tags&page=1&ordering=last_updated).
2. Python версии не ниже 3.7.
3. Установлены зависимости: `flask` `flask-jsonpify` `flask-restful`.
4. Создана директория `/python_api`.
5. Скрипт из репозитория размещён в /python_api.
6. Точка вызова: запуск скрипта.
7. При комите в любую ветку должен собираться docker image с форматом имени hello:gitlab-$CI_COMMIT_SHORT_SHA . Образ должен быть выложен в Gitlab registry или yandex registry.   

***Решение:***  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/35e8cd6d-d19c-411a-81fb-6f6f97767022)    
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/14a701b9-e8a6-413f-8e7a-721e94845832)  

Ссылка на image: acheusov.gitlab.yandexcloud.net:5050/acheusov/netology-new1/python-api:latest  


[gitlab-ci.yml](https://github.com/AndrewAche/HW_ALL/blob/main/CICD/5-Gitlab/gitlab-ci.yml)  
[Dockerfile](https://github.com/AndrewAche/HW_ALL/blob/main/CICD/5-Gitlab/Dockerfile)  
Ссылка на проект: https://acheusov.gitlab.yandexcloud.net/acheusov/netology-new1






