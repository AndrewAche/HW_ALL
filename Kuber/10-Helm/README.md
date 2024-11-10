# [Домашнее задание](https://github.com/netology-code/kuber-homeworks/blob/main/2.5/2.5.md) к занятию «Helm»- `Ачеусов Андрей`


### Задание 1. Подготовить Helm-чарт для приложения   

***Решение:***  

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения.  
2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.  

![image](https://github.com/user-attachments/assets/08a998ca-b41d-46bc-8fa6-375a8f81fc43)  
Создание шаблона:   
![image](https://github.com/user-attachments/assets/40730bbb-c295-4a90-9a3f-a58bb914b524)  

3. В переменных чарта измените образ приложения для изменения версии.  
![image](https://github.com/user-attachments/assets/d268e90c-6ff8-4746-baa3-f22f23926754)  
![image](https://github.com/user-attachments/assets/5de22a6d-a951-4a9d-a763-ff84c58b732e)  


---


### Задание 2. Запустить две версии в разных неймспейсах   

***Решение:***  

1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.  
2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.  
3. Продемонстрируйте результат.  

Проверка:   
![image](https://github.com/user-attachments/assets/fafb486b-08bd-42f0-a907-1402762bf8e2)  
![image](https://github.com/user-attachments/assets/1b4ae68b-8066-47f1-9a8f-be00b05e4f4f)  
Запуск нескольких версий приложения:  
![image](https://github.com/user-attachments/assets/d571b135-86bb-478f-b242-be2b0ca60080)  
![image](https://github.com/user-attachments/assets/301e567e-4a98-4ea5-acf4-ed1c76449b42)  

---
