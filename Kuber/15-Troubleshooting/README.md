# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/3.5/3.5.md) к занятию «Troubleshooting»- `Ачеусов Андрей`


### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить  
1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```
2. Выявить проблему и описать.
3. Исправить проблему, описать, что сделано.
4. Продемонстрировать, что проблема решена.


***Решение:***  

После запуска команды:  
![image](https://github.com/user-attachments/assets/0b2f2f1f-4ff9-4a07-a47b-fd3c2cd65d5a)  
Проблема в отсутствии namespaces, создаю их и запускаю заново:  
![image](https://github.com/user-attachments/assets/160808cb-56fe-4646-898c-6137c6e4d39c)  
![image](https://github.com/user-attachments/assets/410c3fc4-d8ff-4f70-8557-1b478a343953)  
![image](https://github.com/user-attachments/assets/ca0a31ce-940d-4b54-b05a-15f02f4c9a85)  


```bash

```


---
