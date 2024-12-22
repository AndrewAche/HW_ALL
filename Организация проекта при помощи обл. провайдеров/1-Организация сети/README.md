# [Домашнее задание](https://github.com/netology-code/clopro-homeworks/blob/main/15.1.md) к занятию  "Организация сети" - `Ачеусов Андрей`


### Задание 1

1. Yandex Cloud

***Решение:***  

1. Создать пустую VPC. Выбрать зону.  
![image](https://github.com/user-attachments/assets/0c41e116-2250-4655-b5c2-503771bc86d9)  


3. Публичная подсеть.

 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
![image](https://github.com/user-attachments/assets/20744744-a26a-484d-b8b6-f4bec034ffbe)  
![image](https://github.com/user-attachments/assets/f72b40e0-3e8a-4e85-bd73-54954446d489)  
![image](https://github.com/user-attachments/assets/49945971-18f5-4ec8-b807-e2a868b1eb77)  
```
Microsoft Windows [Version 10.0.22631.4460]
(c) Корпорация Майкрософт (Microsoft Corporation). Все права защищены.

C:\Users\Андрей>ssh acheusov@158.160.56.93
The authenticity of host '158.160.56.93 (158.160.56.93)' can't be established.
ED25519 key fingerprint is SHA256:qjYZ8ijKQ2btABoW2XsulwVoiHg3V0+Ua+5LHjwFklg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '158.160.56.93' (ED25519) to the list of known hosts.
Welcome to Ubuntu 24.04.1 LTS (GNU/Linux 6.8.0-50-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Dec 22 05:17:21 PM UTC 2024

  System load:  0.16               Processes:             139
  Usage of /:   14.9% of 19.59GB   Users logged in:       0
  Memory usage: 10%                IPv4 address for eth0: 192.168.10.27
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.
```

3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.




---

