-- Задание №1.

CREATE DATABASE HomeTask_3;
USE HomeTask_3;

CREATE TABLE salespeople
(
	snum INT NOT NULL PRIMARY KEY,
    sname VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    comm VARCHAR(10) NOT NULL
);

INSERT INTO salespeople(snum, sname, city, comm)
VALUES
	(1001, "Peel", "London", ".12"),
	(1002, "Serres", "San Jose", ".13"),
	(1004, "Motika", "London", ".11"),
	(1007, "Rifkin", "Barcelona", ".15"),
	(1003, "Axelrod", "New York", ".10");

SELECT * FROM salespeople;

CREATE TABLE customers 
(
	cnum INT NOT NULL PRIMARY KEY,
    cname VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    rating INT NOT NULL,
    snum INT NOT NULL,
    foreign key(snum)
    references salespeople (snum)
);

INSERT INTO customers(cnum, cname, city, rating, snum)
VALUES
	(2001, "Hoffman", "London", 100, 1001),
	(2002, "Giovanni", "Rome", 200, 1003),
	(2003, "Liu", "SanJose", 200, 1002),
	(2004, "Grass", "Berlin", 300, 1002),
	(2006, "Clemens", "London", 100, 1001),
	(2008, "Cisneros", "SanJose", 300, 1007),
	(2007, "Pereira", "Rome", 100, 1004);

SELECT * FROM customers;

CREATE TABLE orders 
(
	onum INT NOT NULL PRIMARY KEY,
    amt DECIMAL(10,2),
    odate DATE NOT NULL,
    cnum INT NOT NULL,
    snum INT NOT NULL,
    foreign key(cnum)
    references customers(cnum),
    foreign key(snum)
    references salespeople(snum)
);

INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES
	(3001, 18.69, "1990-03-10", 2008, 1007),
	(3003, 767.19, "1990-03-10", 2001, 1001),
	(3002, 1900.10, "1990-03-10", 2007, 1004),
	(3005, 5160.45, "1990-03-10", 2003, 1002),
	(3006, 1098.16, "1990-03-10", 2008, 1007),
	(3009, 1713.23, "1990-04-10", 2002, 1003),
	(3007, 75.75, "1990-04-10", 2004, 1002),
	(3008, 4723.00, "1990-05-10", 2006, 1001),
	(3010, 1309.95, "2016-01-01", 2004, 1002),
	(3011, 9891.88, "2016-01-01", 2006, 1001);

SELECT * FROM orders;


-- 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.

SELECT odate "Дата заказа", SUM(amt) "Сумма заказов" FROM orders
WHERE odate = "2016-01-01";


-- 2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.

SELECT DISTINCT city FROM customers;

SELECT COUNT(DISTINCT city) "Кол-во городов" FROM customers;


-- 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.

SELECT cnum, MIN(amt) "Наименьшая сумма" FROM orders
GROUP BY cnum; 


-- 4*. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г. 
-- Используется оператор "LIKE": https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html

SELECT * FROM customers
WHERE cname LIKE 'G%';


-- 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.

SELECT city, MAX(rating) "Высший рейтинг" FROM customers
GROUP BY city; 



-- Задание №2.

CREATE TABLE emploies
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NULL,
    surname VARCHAR(100) NULL,
    speciality VARCHAR(100) NULL,
    seniority INT NULL,
    salary INT NULL,
    age INT NULL
);

INSERT INTO emploies (name, surname, speciality, seniority, salary, age)
VALUES
	("Вася", "Васькин", "начальник", 40, 100000, 60),
    ("Петя", "Петькин", "начальник", 8, 70000, 30),
    ("Катя", "Катькина", "инженер", 2, 70000, 25),
    ("Саша", "Сашкин", "инженер", 12, 50000, 35),
    ("Иван", "Иванов", "рабочий", 40, 30000, 59),
    ("Вася", "Васькин", "начальник", 40, 100000, 60),
    ("Петя", "Петькин", "начальник", 8, 70000, 30),
    ("Катя", "Катькина", "инженер", 2, 70000, 25),
    ("Саша", "Сашкин", "инженер", 12, 50000, 35),
    ("Иван", "Иванов", "рабочий", 40, 30000, 59);

SELECT * FROM emploies;

-- 1. Отсортируйте поле “Зарплата” в порядке убывания и возрастания.

SELECT * FROM emploies
ORDER BY salary DESC;

SELECT * FROM emploies
ORDER BY salary;


-- 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой.

SELECT * FROM emploies
ORDER BY salary
LIMIT 5, 5;


-- 3. Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000.

SELECT speciality, COUNT(speciality), COUNT(DISTINCT surname) FROM emploies
WHERE speciality = "рабочий" AND salary > 20000
GROUP BY speciality;


SELECT CONCAT(name, " ", surname) AS name_surname, speciality FROM emploies
WHERE speciality = "рабочий" AND salary > 20000
GROUP BY name_surname;

