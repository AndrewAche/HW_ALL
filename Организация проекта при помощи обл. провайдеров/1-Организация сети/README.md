# [Домашнее задание](https://github.com/netology-code/clopro-homeworks/blob/main/15.1.md) к занятию  "Организация сети" - `Ачеусов Андрей`


### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.
 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.

[Terraform](https://github.com/AndrewAche/HW_ALL/tree/main/Организация%20проекта%20при%20помощи%20обл.%20провайдеров/1-Организация%20сети/Config_Terraform)

```
### Подключение к public:

root@vm-mint:/home/msi/devops-netology# ssh -i /root/.ssh/id.rsa ubuntu@158.160.116.100
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-156-generic x86_64)

### Проверка доступа в интернет:

ubuntu@public:~/$ ping google.com
PING google.com (173.194.220.100) 56(84) bytes of data.
64 bytes from lk-in-f100.1e100.net (173.194.220.100): icmp_seq=1 ttl=58 time=21.1 ms
64 bytes from lk-in-f100.1e100.net (173.194.220.100): icmp_seq=2 ttl=58 time=21.0 ms
64 bytes from lk-in-f100.1e100.net (173.194.220.100): icmp_seq=3 ttl=58 time=20.9 ms

```
![image](https://github.com/user-attachments/assets/da85a905-4602-4849-95e9-c5295dbe74dc)


3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

```
### Подключение к private, находясь в public:

ubuntu@public:~/$ ssh -i /home/ubuntu/.ssh/id.rsa ubuntu@192.168.20.17
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-156-generic x86_64)

### Проверяем доступ в интернет:

ubuntu@private:~$ ping google.com
PING google.com (216.58.209.206) 56(84) bytes of data.
64 bytes from hem09s03-in-f14.1e100.net (216.58.209.206): icmp_seq=1 ttl=54 time=25.5 ms
64 bytes from hem09s03-in-f14.1e100.net (216.58.209.206): icmp_seq=2 ttl=54 time=24.4 ms
64 bytes from hem09s03-in-f14.1e100.net (216.58.209.206): icmp_seq=3 ttl=54 time=24.4 ms
```


