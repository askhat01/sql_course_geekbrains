/*Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно переместить любого (одного) пользователя из 
таблицы users в таблицу users_old. (использование транзакции с выбором commit или rollback – обязательно).*/

CREATE PROCEDURE move_user_to_old(IN user_id INT)
BEGIN 
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN 
ROLLBACK;
END;

START TRANSACTION;

/*Получаем данные пользователя*/
SELECT *
INTO @user_id, @firstname, @lastname, @email
FROM users 
WHER id = user_id;

/*Вставляем данные пользователя в таблицу user_old*/
INSERT INTO user_old (id, firstname, lastname, email)
VALUES (@user_id, @firstname, @lastname, @email);

/*Удаляем пользователя из таблицы users*/
DELETE FROM users
WHERE id = user_id;

COMMIT; 
END;


/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 
— "Доброй ночи".*/

DELIMITER //

CREATE FUNCTION hello ()
RETURNS TINYTEXT NOT DETERMINISTIC
BEGIN
	DECLARE hour INT;
	SET hour = HOUR(NOW());
	CASE
		WHEN hour BETWEEN 0 AND 5 THEN RETURN "Доброй ночи";
		WHEN hour BETWEEN 6 AND 11 THEN RETURN "Доброе утро";
		WHEN hour BETWEEN 12 AND 17 THEN RETURN "Добрый день";
		WHEN hour BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
	END CASE;
END//

SELECT NOW(), hello()//


/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, communities и messages в таблицу logs помещается время и 
дата создания записи, название таблицы, идентификатор первичного ключа*/
CREATE TABLE logs (
tablename VARCHAR(255) COMMENT 'Название таблицы',
extenal_id INT COMMENT 'Первичный ключ таблицы tablename',
name VARCHAR(255) COMMENT 'Поле name таблицы tablename',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) COMMENT = 'Журнал интернет-магазина' ENGINE=Archive;

DELIMITER //
CREATE TRIGGER log_after_insert_to_users AFTER INSERT ON users
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, extenal_id, name) VALUES('users', NEW.id, NEW.name);
END//

INSERT INTO users (name, birthday_at) VALUES ('Роман', '1995-11-05')//

/*Триггер для таблицы Products*/
CREATE TRIGGER log_after_insert_to_users AFTER INSERT ON products
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, extenal_id, name) VALUES('products', NEW.id, NEW.name);
END//

/*Триггер для таблицы Catalogs*/
CREATE TRIGGER log_after_insert_to_users AFTER INSERT ON catalogs
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, extenal_id, name) VALUES('catalogs', NEW.id, NEW.name);
END//