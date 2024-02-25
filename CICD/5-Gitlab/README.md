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
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/45717fcd-cb36-4c92-9bbf-4b20dfc34a82)  
Затем всё падает в ошибку:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/f5105f7b-ea29-482f-b4b9-29656b228a51)
```
Checking out ac48f7ef as detached HEAD (ref is main)...

Skipping Git submodules setup
Executing "step_script" stage of the job script
Using docker image sha256:1588477122de4fdfe9fcb9ddeeee6ac6b93e9e05a65c68a6e22add0a98b8e0fe for docker:20.10.5 with digest docker@sha256:7ed427295687586039ff3433bb9b4419c5cf1e6294025dadf7641126665a78f5 ...
$ docker build -t $CI_REGISTRY/acheusov/netology-11/python-api:latest .
unable to prepare context: unable to evaluate symlinks in Dockerfile path: lstat /builds/acheusov/netology-example3/Dockerfile: no such file or directory
Cleaning up project directory and file based variables
ERROR: Job failed: exit code 1
```

[gitlab-ci.yml](https://github.com/AndrewAche/HW_ALL/blob/main/CICD/5-Gitlab/gitlab-ci.yml)
[Dockerfile](https://github.com/AndrewAche/HW_ALL/blob/main/CICD/5-Gitlab/Dockerfile)



  

### Product Owner

Вашему проекту нужна бизнесовая доработка: нужно поменять JSON ответа на вызов метода GET `/rest/api/get_info`, необходимо создать Issue в котором указать:

1. Какой метод необходимо исправить.
2. Текст с `{ "message": "Already started" }` на `{ "message": "Running"}`.
3. Issue поставить label: feature.

***Решение:***  


### Developer

Пришёл новый Issue на доработку, вам нужно:

1. Создать отдельную ветку, связанную с этим Issue.
2. Внести изменения по тексту из задания.
3. Подготовить Merge Request, влить необходимые изменения в `master`, проверить, что сборка прошла успешно.

***Решение:***  


### Tester

Разработчики выполнили новый Issue, необходимо проверить валидность изменений:

1. Поднять докер-контейнер с образом `python-api:latest` и проверить возврат метода на корректность.
2. Закрыть Issue с комментарием об успешности прохождения, указав желаемый результат и фактически достигнутый.

***Решение:***  




