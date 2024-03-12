# [Домашнее задание](https://github.com/netology-code/mnt-homeworks/blob/MNT-video/09-ci-05-teamcity/README.md) к занятию  "Teamcity" - `Ачеусов Андрей`

### Подготовка
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/b1617d56-fd49-4007-9043-7f73f3cb740a)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/b9b65153-e584-471a-a86a-636ae5d22556)   

Агент авторизован:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/61266547-85bf-4aab-8203-ecaa41bc61c8)  




### Задание 1

1. Создайте новый проект в teamcity на основе fork.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/36df5f33-0741-4d7f-bcbf-92c1a90a0f90)


---


### Задание 2

2. Сделайте autodetect конфигурации.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/a4bacf84-576d-4031-b884-13fb91e2aa27)


---


### Задание 3

3. Сохраните необходимые шаги, запустите первую сборку master.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/d2170845-0401-4227-9f7f-9622e742efc9)


---


### Задание 4

4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/6579c371-018f-4ed8-b876-de5ca64d138e)


---


### Задание 5

5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/a88ef93a-1529-4e66-a820-e59ae3cad439)


---


### Задание 6

6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.

---


### Задание 7

7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/2514b1cc-a899-4633-b4ff-800e25f7ac75)  
В моем случае версия 0.0.2:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/43b4ef0c-d1b9-49cc-a422-0c43c7df4d50)  


---


### Задание 8

8. Мигрируйте `build configuration` в репозиторий.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/58bfb905-5747-4bb6-a33c-700c20499b87)


---


### Задание 9

9. Создайте отдельную ветку `feature/add_reply` в репозитории.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/ae931f64-a69a-419d-bcd0-17fe7a7b9bdc)


---


### Задание 10

10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/78898e2b-d052-44a2-98ba-7c7fabfc1034)  


---


### Задание 11

11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/3c1f553c-fc22-4c71-a468-f87fed9fabce)


---


### Задание 12

12. Сделайте push всех изменений в новую ветку репозитория.

---


### Задание 13

13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.

***Решение:***  



---


### Задание 14

14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.

***Решение:***  



---


### Задание 15

15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.

***Решение:***  



---


### Задание 16

16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.

***Решение:***  



---


### Задание 17

17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.


***Решение:***  



---


### Задание 18

18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.

***Решение:***  



---


### Задание 19

19. В ответе пришлите ссылку на репозиторий.

***Решение:***  

https://github.com/AndrewAche/example-teamcity.git

---
