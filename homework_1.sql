/*1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными*/
CREATE TABLE `lesson_1`.`phones` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(80) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `ProductCount` INT NOT NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE);

INSERT INTO `lesson_1`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone X', 'Apple', '3', '76000');
INSERT INTO `lesson_1`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone 8', 'Apple', '2', '51000');
INSERT INTO `lesson_1`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `lesson_1`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S8', 'Samsung', '1', '41000');
INSERT INTO `lesson_1`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('P20 Pro', 'Huawei', '5', '36000');


/*2. Выведите название, производителя и цену для товаров, количество которых превышает 2*/
select ProductName, Manufacturer, Price
from lesson_1.phones
where ProductCount > 2


/*3. Выведите весь ассортимент товаров марки Samsung*/
select *
from lesson_1.phones
where Manufacturer = "Samsung"


/*4.1. Товары, в которых есть упоминание Iphone*/
select *
from lesson_1.phones
where ProductName like "%Iphone%"


/*4.2. Samsung*/
select *
from lesson_1.phones
where ProductName like "%Samsung%"


/*4.3. Товары, в которых есть ЦИФРЫ*/
select *
from lesson_1.phones
where ProductName RLIKE '[0-9]'


/*4.4. Товары, в которых есть ЦИФРА 8*/
select *
from lesson_1.phones
where ProductName like '%8%'

