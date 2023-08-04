/*1. Используя операторы SQL, создайте таблицу sales. Заполните ее данными*/
CREATE TABLE `lesson_1`.`sales` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `count_product` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE);

INSERT INTO `lesson_1`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-01', '156');
INSERT INTO `lesson_1`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-02', '180');
INSERT INTO `lesson_1`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-03', '21');
INSERT INTO `lesson_1`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-04', '124');
INSERT INTO `lesson_1`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-05', '341');


/*2. Для данных таблицы sales укажите тип заказа в зависимости от кол-ва*/
SELECT ID, 
CASE 
	WHEN count_product < 100
		THEN 'Маленький заказ'
    WHEN  count_product > 300
		THEN 'Большой заказ'
	ELSE 'Средний заказ'
END AS 'Размер заказа'
FROM lesson_1.sales;

/*3. Создайте таблицу orders, заполните ее значениями*/
CREATE TABLE `lesson_1`.`orders` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `employee_id` VARCHAR(45) NOT NULL,
  `amount` DECIMAL NOT NULL,
  `order_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE);

INSERT INTO `lesson_1`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e03', '15.00', 'OPEN');
INSERT INTO `lesson_1`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e01', '25.50', 'OPEN');
INSERT INTO `lesson_1`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e05', '100.70', 'CLOSED');
INSERT INTO `lesson_1`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e02', '22.18', 'OPEN');
INSERT INTO `lesson_1`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e04', '9.50', 'CANCELLED');

SELECT ID,
CASE
	WHEN order_status = 'OPEN'
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED'
		THEN 'Order is closed'
	ELSE 'Order is cancelled'
END AS full_order_status
FROM lesson_1.orders;


/*
4. Чем 0 отличается от NULL? 
Ответ: 
NULL – это не ноль, это не пустая строка (это ни что, т.е. отсутствие данных, никакой информации нет).
0 — это арифметическое значение, константа. 
*/
