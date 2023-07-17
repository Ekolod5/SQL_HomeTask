CREATE DATABASE HomeTask_4;
USE HomeTask_4;

CREATE TABLE AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

SELECT * FROM AUTO;

-- Задание 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA.
SELECT MARK "Марка машины", COLOR "Цвет", count(*) "Количество машин" 
FROM AUTO 
WHERE MARK IN ("BMW", "LADA")
GROUP BY MARK, COLOR
ORDER BY MARK, COLOR;

SELECT MARK "Марка машины", COLOR "Цвет", COUNT(color) AS "Количество машин"  
FROM AUTO
WHERE MARK = "LADA"
GROUP BY color, mark 
UNION SELECT MARK "Марка машины", COLOR "Цвет", COUNT(color) AS "Количество машин"  
FROM AUTO
WHERE MARK = "BMW"
GROUP BY MARK, COLOR;


-- Задание 2. Вывести на экран марку авто и количество AUTO не этой марки.
SELECT DISTINCT MARK "Марка машины", COUNT(*) "Количество машин", 
    (SELECT SUM(a.total) 
		FROM (SELECT MARK, COUNT(*) total 
				FROM AUTO 
                GROUP BY MARK
                HAVING MARK != a_all.MARK) a) "Количество машин не этой марки"
FROM AUTO a_all
GROUP BY MARK;


-- Задание 3.
-- Даны 2 таблицы, созданные следующим образом:

CREATE TABLE test_a (id INT, DATA VARCHAR(1));

CREATE TABLE test_b (id INT);

INSERT INTO test_a(id, DATA)
VALUES
	(10, 'A'),
	(20, 'A'),
	(30, 'F'),
	(40, 'D'),
	(50, 'C');

INSERT INTO test_b(id)
VALUES
	(10),
	(30),
	(50);

-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT a. * FROM test_a a
LEFT JOIN test_b b 
ON a.id = b.id
WHERE b.id IS NULL;
