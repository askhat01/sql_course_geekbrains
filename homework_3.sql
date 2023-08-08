/*1. Напишите запрос, который вывел бы таблицы со столбцами в следующем порядке: city, sname, snum, comm*/
SELECT city, sname, snum, comm
FROM salespeople


/*2. Напишите команду SELECT, которая вывела бы оценку (rating), сопроваждаемую именем каждого заказчика в городе San Jose*/
SELECT cname, rating
FROM customers
WHERE city = 'San Jose'


/*3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений*/
SELECT DISTINCT(o.snum), s.sname
FROM orders o
LEFT JOIN salespeople s on o.snum = s.snum


/*4. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G*/
SELECT cname
FROM customers
where cname LIKE 'G%'


/*5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1000*/
SELECT onum, amt
FROM orders
WHERE amt > 1000


/*6. Напишите запрос, который выбрал бы наименькую сумму заказа*/
SELECT MIN(amt) as 'Наименьшая сумма заказа'
FROM orders
/*или*/
SELECT onum, amt
FROM orders
ORDER BY amt ASC
limit 1


/*7. Напишите запрос к таблице Заказчики, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся в Риме*/
SELECT cname
FROM customers 
WHERE rating > 100 
AND city <> "Rome"


/*8. Отсортируйте поле Зарплата в порядке убывания и возрастания*/
SELECT first_name, last_name, salary
FROM staff
ORDER BY salary DESC, salary ASC


/*9. Отсортируейте по возрастанию поле Зарплата и выведите 5 строк с наибольшей зарплатой*/
SELECT first_name, last_name, salary
FROM staff
ORDER BY salary
limit 7, 5


/*10. Выполните группировку всех сотрудников по специальности, суммарная зарплата которых больше 100000*/
SELECT post, SUM(salary)
FROM staff
GROUP BY post
HAVING SUM(salary) > 100000