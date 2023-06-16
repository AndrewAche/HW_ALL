# Домашнее задание к занятию  12.5. "Индексы" - `Ачеусов Андрей`

### Задание 1

![image](https://github.com/AndrewAche/HW_ALL/assets/121398221/58aa5c43-5f48-4715-9d8c-8b2a4fd7230f)  
select sum(index_length) / (select sum(data_length) + sum(index_length)) * 100
from INFORMATION_SCHEMA.TABLES

---



### Задание 2

- не нужен f.title и соответственно таблица film f (убрать)  
- сделать индексом p.payment_date (из таблицы payment p)  
- не нужен оператор distinct (убрать), поскольку есть условие r.customer_id = c.customer_id  
- не нужен оператор over (partition by c.customer_id) поскольку таблица будет формироваться и так по уникальным значениям c.customer_id  (т.к. есть concat(c.last_name, ' ', c.first_name)  и условие r.customer_id = c.customer_id)  

Итоговый запрос:  
CREATE INDEX index1 ON payment(payment_id);
select concat(c.last_name, ' ', c.first_name) as name, sum(p.amount)
from payment p, rental r, customer c, inventory i
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
group by name

---

