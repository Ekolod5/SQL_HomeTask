-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.

CREATE DATABASE HomeTask_2;
USE HomeTask_2;

CREATE TABLE sales
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO sales (order_date, quantity)
VALUES
	("2021-01-01", 250),
	("2022-01-02", 200),
	("2021-01-03", 80),
	("2021-01-04", 150),
	("2021-01-05", 350);

SELECT * FROM sales;

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT
	id,
	order_date,
	CASE
		WHEN quantity < 100 THEN "less than equal to 100"
		WHEN quantity >= 100 AND quantity <= 300 THEN "101 to 300"
		ELSE "greater than 300"
	END bucket
FROM sales;


-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE.

CREATE TABLE orders 
(
    orderid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employeeid VARCHAR(5) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    orderstatus VARCHAR(10) NOT NULL
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
	("e03", 15.00, "OPEN"),
	("e01", 25.50, "OPEN"),
	("e05", 100.70, "CLOSED"),
    ("e02", 22.18, "OPEN"),
    ("e04", 9.50, "CANCELLED"),
    ("e04", 99.99, "OPEN");
    
SELECT * FROM orders;

SELECT 
	orderid, 
    orderstatus,
	CASE orderstatus
		WHEN "OPEN" THEN "Order is in open state."
		WHEN "CLOSED" THEN "Order is closed."
		ELSE "Order is cancelled."
	END order_summary
FROM orders;


-- 4. Чем NULL отличается от 0?
/* "0" — числовое значение. 
"NULL" - специальное значение(псевдозначение), которое используется в SQL для обозначения отсутствия данных. */
