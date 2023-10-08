# Домашнее задание к занятию  05-virt-02-iaac - `Ачеусов Андрей`

### Задание 1


Опишите основные преимущества применения на практике IaaC-паттернов:  
* Скорость и уменьшение затрат: позволяет быстрее конфигурировать инфраструктуру и направлен на обеспечение прозрачности.
* Восстановление в аварийных ситуациях: эффективный способ отслеживания вашей инфраструктуры и повторного развертывания последнего работоспособного состояния после сбоя или катастрофы любого рода.
* Безопасность и документирование: за провижен всех вычислительных, сетевых и служб хранения отвечает код, они каждый раз будут развертываться одинаково. Т.к. код можно версионировать, IaaC позволяет документировать, регистрировать и отслеживать каждое изменение конфигурации вашего сервера.
* Масштабируемость и стандартизация: развертывания инфраструктуры с помощью IaaC повторяемы и предотвращают проблемы во время выполнения, вызванных дрейфом конфигурации или отсутствием зависимостей. IaaC полностью стандартизирует сетап инфраструктуры, что снижает вероятность ошибок или отклонений.`

Какой из принципов IaaC является основополагающим?:  
* Идемпотентность - свойство объекта или операции при повторном применении операции к объекту давать тот же результат,
что и при первом.


---



### Задание 2





---



### Задание 3


Установите на личный компьютер:  

* VirtualBox,
* Vagrant,
* Terraform,
* Ansible.

VirtualBox:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/bf404fbd-a2fe-4d72-a434-c3bda8bd8529)  
`acheusov1@acheusov1:~$ vboxmanage --version
6.1.46r158378`

Vagrant:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/a2ed3c84-7e21-4c6a-9d0d-8c04ff68b165)  
`acheusov1@acheusov1:~$ sudo vagrant --version
Vagrant 2.3.7`

Terraform:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/fe099ca9-6aef-4e0e-a7b2-7464e7d06d71)  
`acheusov1@acheusov1:~$ terraform -v
Terraform v1.6.0
on linux_amd64`

Ansible:  
![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/6c5d494e-7bc1-4c73-a215-5ae57fdc317f)  
` acheusov1@acheusov1:~$ ansible --version
ansible 2.10.8
  config file = None
  configured module search path = ['/home/acheusov1/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.9.2 (default, Feb 28 2021, 17:03:44) [GCC 10.2.1 20210110] `

---



### Задание 4





---

