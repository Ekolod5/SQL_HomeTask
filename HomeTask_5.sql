CREATE DATABASE HomeTask_5;
USE HomeTask_5;

CREATE TABLE Cars
(       
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(20) NOT NULL, 
	Cost DECIMAL(10, 2) NOT NULL
);

INSERT INTO Cars (Name,	Cost)
VALUES
	("Audi", 52642.00),
	("Mercedes", 57127.00),
	("Skoda", 9000.00),
	("Volvo", 29000.00),
	("Bentley", 350000.00),
	("Citroen", 21000.00),
	("Hummer", 41400.00),
	("Volkswagen", 21600.00);

SELECT * FROM Cars;

/*
1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов 
CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000.
*/

CREATE VIEW Cheap_Cars AS (SELECT * FROM Cars WHERE Cost < 25000.00);
SELECT * FROM Cheap_Cars;


/*
2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
(используя оператор ALTER VIEW) ALTER VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<30000.
*/

ALTER VIEW Cheap_Cars AS (SELECT * FROM Cars WHERE Cost < 30000.00);
SELECT * FROM Cheap_Cars;


/*
3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично). 
*/

CREATE VIEW Сar_model AS (SELECT * FROM Cars WHERE Name IN ("Skoda", "Audi"));
SELECT * FROM Сar_model;


/*
4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. 
Есть таблица анализов Analysis: an_id — ID анализа; an_name — название анализа; an_cost — себестоимость анализа; 
an_price — розничная цена анализа; an_group — группа анализов. 
Есть таблица групп анализов Groups: gr_id — ID группы; gr_name — название группы; gr_temp — температурный режим хранения. 
Есть таблица заказов Orders: ord_id — ID заказа; ord_datetime — дата и время заказа; ord_an — ID анализа.
*/

CREATE TABLE Analysis 
(
	an_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    an_name VARCHAR(100) NOT NULL,
    an_cost DECIMAL(10,2) NOT NULL,
    an_price DECIMAL(10,2) NOT NULL,
    an_group INT 
);

INSERT INTO Analysis (an_name, an_cost, an_price, an_group)
VALUES
	("Взятие биоматериала (венозная кровь)", 50.00, 120.00, 1),
	("Глюкоза", 100.00, 210.00, 2),
	("Билирубин общий", 100.00, 220.00, 2),
	("Билирубин прямой", 100.00, 220.00, 2),
	("Холестерин общий", 100.00, 210.00, 2),
	("Белок общий", 100.00, 220.00, 2),
	("Витамин D (25-ОН витамин D)", 825.00, 1650.00, 3),
	("Витамин С (аскорбиновая кислота)", 1050.00, 2100.00, 3),
	("Витамин В1 (тиамин)", 1050.00, 2100.00, 3),    
	("Витамин В9 (фолат, фолиевая кислота)", 490.00, 980.00, 3);
    
SELECT * FROM Analysis;


CREATE TABLE Groupses
(
	gr_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    gr_name VARCHAR(100) NOT NULL,
    gr_temp FLOAT
);

INSERT INTO Groupses (gr_name, gr_temp)
VALUES
	('AAA', 4.00),
	('BBB', 4.02),
	('CCC', 4.05);

SELECT * FROM Groupses;


CREATE TABLE Orders
(
	ord_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ord_datetime TIMESTAMP,
    ord_an INT
);

INSERT INTO Orders (ord_datetime, ord_an)
VALUES
	("2020-02-01 09:00:00", 1),
	("2020-02-01 09:00:00", 9),
	("2020-02-02 10:00:00", 1),
	("2020-02-02 10:00:00", 3),
	("2020-02-03 09:00:00", 1),
	("2020-02-03 09:00:00", 4),
	("2020-02-04 10:00:00", 1),
	("2020-02-04 10:00:00", 8),
	("2020-02-05 09:00:00", 1),
	("2020-02-05 09:00:00", 2),
	("2020-02-06 10:00:00", 1),
	("2020-02-06 10:00:00", 5),
	("2020-02-07 09:00:00", 1),
	("2020-02-07 09:00:00", 6),
	("2020-02-08 10:00:00", 1),
    ("2020-02-08 10:00:00", 7),
	("2020-02-09 09:00:00", 1),
	("2020-02-09 09:00:00", 10);

SELECT * FROM Orders;

WITH selection_1 AS (SELECT * FROM Orders WHERE ord_datetime REGEXP "2020-02-([0][5-9])")
SELECT an_name "Название анализа", an_price "Розничная цена анализа", ord_datetime "Дата и время заказа" 
FROM Analysis INNER JOIN selection_1 
ON an_id = ord_an
ORDER BY ord_datetime;

