-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными.
CREATE DATABASE HomeTask_1;
USE HomeTask_1;

CREATE TABLE mobile_phones 
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  model VARCHAR(45) NOT NULL,
  manufacturer VARCHAR(45) NOT NULL,
  price DECIMAL NULL,
  quantity INT NOT NULL
  );
  
INSERT INTO mobile_phones
  (model, manufacturer, price, quantity) 
VALUES 
("Galaxy A04e 3/64 Gb", "Samsung", 10990, 25),
("Galaxy A23 4/64 Gb", "Samsung", 16990, 25),
("Galaxy M14 4/64 Gb", "Samsung", 20790, 20),
("Galaxy M14 128 Gb", "Samsung", 20999, 20),
("Galaxy A34 8/128 Gb", "Samsung", 26990, 20),
("Galaxy S22 8/128 Gb", "Samsung", 54999, 15),
("Galaxy A34 8/256 Gb", "Samsung", 29490, 20),
("Galaxy A54 256 Gb", "Samsung", 38999, 20),
("Galaxy S22 8/256 Gb", "Samsung", 64990, 15),
("Redmi 9A 32 Gb", "Xiaomi", 4990, 15),
("Redmi 10A 32 Gb", "Xiaomi", 7499, 20),
("Redmi 12C 3/64 Gb", "Xiaomi", 9990, 20),
("POCO M5 4/64 Gb", "Xiaomi", 13490, 10),
("Redmi 12 4/128 Gb", "Xiaomi", 14999, 10),
("POCO M5 4/128 Gb", "Xiaomi", 15490, 10),
("iPhone 11 Pro 64 Gb", "Apple", 40290, 2),
("iPhone 12 64 Gb", "Apple", 67990, 8),
("iPhone 12 128 Gb", "Apple", 71990, 1),
("iPhone 13 128 Gb", 'Apple', 79990, 5),
("iPhone 13 256 Gb", 'Apple', 96990, 1),
("iPhone 14 128 Gb", 'Apple', 87790, 6),
("iPhone 14 256 Gb", 'Apple', 103999, 1);


-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2.
SELECT model, manufacturer, price
FROM mobile_phones
WHERE quantity > 2;


-- 3. Выведите весь ассортимент товаров марки “Samsung”.
SELECT * FROM mobile_phones
WHERE manufacturer = 'Samsung';
