# [Домашнее задание](https://github.com/netology-code/mnt-homeworks/blob/MNT-video/10-monitoring-03-grafana/README.md) к занятию  "14.Средство визуализации Grafana" - `Ачеусов Андрей`


### Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
2. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
3. Подключите поднятый вами prometheus, как источник данных.
4. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/851741ea-5a5a-4c88-9d91-f4181cec8714)


---


### Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
2. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
3. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);
- CPULA 1/5/15;
- количество свободной оперативной памяти;
- количество места на файловой системе.

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/c01ac3b6-dd94-4ba9-8152-f1e8463b8127)  

- утилизация CPU для nodeexporter (в процентах, 100-idle);
```
avg without (cpu)(irate(node_cpu_seconds_total{job="nodeexporter",mode="idle"}[1m])) * 100
```
- CPULA 1/5/15;
```
node_load1{job="nodeexporter"}
node_load5{job="nodeexporter"}
node_load15{job="nodeexporter"}
```
- количество свободной оперативной памяти;
```
node_memory_MemFree_bytes{job='nodeexporter'}
```
- количество места на файловой системе.
```
sum by(device) (node_filesystem_avail_bytes{fstype!="tmpfs"})
```

---


### Задание 3

1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
2. В качестве решения задания приведите скриншот вашей итоговой Dashboard.

***Решение:***  

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/2b2eca7e-cbac-4366-b8e6-45b659245b31)  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/25bc6070-58c9-47ec-8b4d-dc85ff916adf)  


---


### Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
2. В качестве решения задания приведите листинг этого файла.

***Решение:***  

[Dashboard_Export.json](https://github.com/AndrewAche/HW_ALL/blob/main/Monitoring%20and%20Logs/14.Средство%20визуализации%20Grafana/Dashboard_Export.json)

---



