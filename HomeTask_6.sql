CREATE DATABASE HomeTask_6;
USE HomeTask_6;

/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'
*/

DELIMITER $$
CREATE FUNCTION sec(seconds int) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(100);
	DECLARE days INT DEFAULT 0;
	DECLARE hours INT DEFAULT 0;
	DECLARE minutes INT DEFAULT 0;

	IF seconds >= 86400 THEN
		SET days = seconds DIV 86400;
		SET seconds = seconds % 86400;
	END IF;

	IF seconds >= 3600 THEN
		SET hours = seconds DIV 3600;
		SET seconds = seconds % 3600; 
	END IF;

	IF seconds >= 60 THEN
		SET minutes = seconds DIV 60;
		SET seconds = seconds % 60;
	END IF;
  
	SET result = CONCAT(CAST(days AS CHAR), " days ", CAST(hours AS CHAR), " hours ", CAST(minutes AS CHAR), " minutes ");
	SET result = CONCAT(result, CAST(seconds AS CHAR), " seconds");
  
	RETURN result;
END $$

SELECT sec(123456);



/*
2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10.
*/

DELIMITER $$
CREATE FUNCTION numbers()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE result VARCHAR(100) DEFAULT "";
	WHILE i <= 10 DO
		IF (i % 2 = 0) THEN
			SET result = CONCAT(result, " ", i);
			SET i = i + 2;
		ELSE
			SET i = i + 1;
        END IF;
	END WHILE;
RETURN result;
END $$

SELECT numbers();

