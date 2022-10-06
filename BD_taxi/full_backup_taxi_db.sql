--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.1.22.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 17.05.2021 22:39:49
-- Версия сервера: 5.7.25
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Удалить процедуру `proc_add_employee`
--
DROP PROCEDURE IF EXISTS proc_add_employee;

--
-- Удалить процедуру `proc_new_user`
--
DROP PROCEDURE IF EXISTS proc_new_user;

--
-- Удалить процедуру `proc_info_to_mail`
--
DROP PROCEDURE IF EXISTS proc_info_to_mail;

--
-- Удалить процедуру `proc_order_for_driver`
--
DROP PROCEDURE IF EXISTS proc_order_for_driver;

--
-- Удалить таблицу `operator_order`
--
DROP TABLE IF EXISTS operator_order;

--
-- Удалить представление `view_user_orders`
--
DROP VIEW IF EXISTS view_user_orders CASCADE;

--
-- Удалить процедуру `proc_all_info`
--
DROP PROCEDURE IF EXISTS proc_all_info;

--
-- Удалить процедуру `proc_get_car_for_order`
--
DROP PROCEDURE IF EXISTS proc_get_car_for_order;

--
-- Удалить процедуру `proc_new_user_order`
--
DROP PROCEDURE IF EXISTS proc_new_user_order;

--
-- Удалить таблицу `user_order`
--
DROP TABLE IF EXISTS user_order;

--
-- Удалить процедуру `add_address`
--
DROP PROCEDURE IF EXISTS add_address;

--
-- Удалить функцию `func_get_address_id`
--
DROP FUNCTION IF EXISTS func_get_address_id;

--
-- Удалить таблицу `address`
--
DROP TABLE IF EXISTS address;

--
-- Удалить функцию `func_driver_has_car`
--
DROP FUNCTION IF EXISTS func_driver_has_car;

--
-- Удалить таблицу `driver_car`
--
DROP TABLE IF EXISTS driver_car;

--
-- Удалить процедуру `proc_add_car`
--
DROP PROCEDURE IF EXISTS proc_add_car;

--
-- Удалить таблицу `car`
--
DROP TABLE IF EXISTS car;

--
-- Удалить таблицу `class_car`
--
DROP TABLE IF EXISTS class_car;

--
-- Удалить таблицу `status`
--
DROP TABLE IF EXISTS status;

--
-- Удалить таблицу `car_brand`
--
DROP TABLE IF EXISTS car_brand;

--
-- Удалить таблицу `color`
--
DROP TABLE IF EXISTS color;

--
-- Удалить таблицу `type_car`
--
DROP TABLE IF EXISTS type_car;

--
-- Удалить таблицу `group_services`
--
DROP TABLE IF EXISTS group_services;

--
-- Удалить таблицу `add_services`
--
DROP TABLE IF EXISTS add_services;

--
-- Удалить таблицу `employee`
--
DROP TABLE IF EXISTS employee;

--
-- Удалить таблицу `user`
--
DROP TABLE IF EXISTS user;

--
-- Удалить таблицу `role`
--
DROP TABLE IF EXISTS role;

--
-- Создать таблицу `role`
--
CREATE TABLE role (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_role_name` для объекта типа таблица `role`
--
ALTER TABLE role
ADD UNIQUE INDEX UK_role_name (name);

--
-- Создать таблицу `user`
--
CREATE TABLE user (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  last_name varchar(255) NOT NULL,
  patronymic varchar(255) NOT NULL,
  login varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  role_id int(11) NOT NULL,
  phone varchar(255) NOT NULL,
  mail varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 39,
AVG_ROW_LENGTH = 1260,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_user` для объекта типа таблица `user`
--
ALTER TABLE user
ADD UNIQUE INDEX UK_user (login, password);

--
-- Создать внешний ключ
--
ALTER TABLE user
ADD CONSTRAINT FK_user_role_id FOREIGN KEY (role_id)
REFERENCES role (id) ON DELETE CASCADE;

--
-- Создать таблицу `employee`
--
CREATE TABLE employee (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  birth_date date NOT NULL,
  passport varchar(255) NOT NULL,
  num_driver_license varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 19,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_employee_num_driver_license` для объекта типа таблица `employee`
--
ALTER TABLE employee
ADD UNIQUE INDEX UK_employee_num_driver_license (num_driver_license);

--
-- Создать индекс `UK_employee_passport` для объекта типа таблица `employee`
--
ALTER TABLE employee
ADD UNIQUE INDEX UK_employee_passport (passport);

--
-- Создать индекс `UK_employee_user_id` для объекта типа таблица `employee`
--
ALTER TABLE employee
ADD UNIQUE INDEX UK_employee_user_id (user_id);

--
-- Создать внешний ключ
--
ALTER TABLE employee
ADD CONSTRAINT FK_employee_user_id FOREIGN KEY (user_id)
REFERENCES user (id) ON DELETE CASCADE;

--
-- Создать таблицу `add_services`
--
CREATE TABLE add_services (
  id int(11) NOT NULL AUTO_INCREMENT,
  service_name varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_add_services_service_name` для объекта типа таблица `add_services`
--
ALTER TABLE add_services
ADD UNIQUE INDEX UK_add_services_service_name (service_name);

--
-- Создать таблицу `group_services`
--
CREATE TABLE group_services (
  id int(11) NOT NULL AUTO_INCREMENT,
  service1 int(11) NOT NULL,
  service2 int(11) DEFAULT NULL,
  service3 int(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 12,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_group_services` для объекта типа таблица `group_services`
--
ALTER TABLE group_services
ADD UNIQUE INDEX UK_group_services (service1, service2, service3);

--
-- Создать внешний ключ
--
ALTER TABLE group_services
ADD CONSTRAINT FK_groupe_services_service1 FOREIGN KEY (service1)
REFERENCES add_services (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE group_services
ADD CONSTRAINT FK_groupe_services_service2 FOREIGN KEY (service2)
REFERENCES add_services (id) ON DELETE SET NULL;

--
-- Создать внешний ключ
--
ALTER TABLE group_services
ADD CONSTRAINT FK_groupe_services_service3 FOREIGN KEY (service3)
REFERENCES add_services (id) ON DELETE SET NULL;

--
-- Создать таблицу `type_car`
--
CREATE TABLE type_car (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_type_car_name` для объекта типа таблица `type_car`
--
ALTER TABLE type_car
ADD UNIQUE INDEX UK_type_car_name (name);

--
-- Создать таблицу `color`
--
CREATE TABLE color (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 14,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_color_name` для объекта типа таблица `color`
--
ALTER TABLE color
ADD UNIQUE INDEX UK_color_name (name);

--
-- Создать таблицу `car_brand`
--
CREATE TABLE car_brand (
  id int(11) NOT NULL AUTO_INCREMENT,
  brand varchar(50) NOT NULL,
  model varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1123,
AVG_ROW_LENGTH = 73,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_car_brand_name` для объекта типа таблица `car_brand`
--
ALTER TABLE car_brand
ADD UNIQUE INDEX UK_car_brand_name (brand, model);

--
-- Создать таблицу `status`
--
CREATE TABLE status (
  id int(11) NOT NULL AUTO_INCREMENT,
  description varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_status_description` для объекта типа таблица `status`
--
ALTER TABLE status
ADD UNIQUE INDEX UK_status_description (description);

--
-- Создать таблицу `class_car`
--
CREATE TABLE class_car (
  id int(11) NOT NULL AUTO_INCREMENT,
  class_name varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_class_car_class_name` для объекта типа таблица `class_car`
--
ALTER TABLE class_car
ADD UNIQUE INDEX UK_class_car_class_name (class_name);

--
-- Создать таблицу `car`
--
CREATE TABLE car (
  id int(11) NOT NULL AUTO_INCREMENT,
  num varchar(255) NOT NULL,
  VIN varchar(255) NOT NULL,
  brand_id int(11) NOT NULL,
  color_id int(11) NOT NULL,
  type_car_id int(11) NOT NULL,
  class_id int(11) NOT NULL,
  services_id int(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 18,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_car_VIN` для объекта типа таблица `car`
--
ALTER TABLE car
ADD UNIQUE INDEX UK_car_VIN (VIN);

--
-- Создать внешний ключ
--
ALTER TABLE car
ADD CONSTRAINT FK_car_add_services_id FOREIGN KEY (services_id)
REFERENCES group_services (id) ON DELETE SET NULL;

--
-- Создать внешний ключ
--
ALTER TABLE car
ADD CONSTRAINT FK_car_brand_id FOREIGN KEY (brand_id)
REFERENCES car_brand (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE car
ADD CONSTRAINT FK_car_class_id FOREIGN KEY (class_id)
REFERENCES class_car (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE car
ADD CONSTRAINT FK_car_color_id FOREIGN KEY (color_id)
REFERENCES color (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE car
ADD CONSTRAINT FK_car_type_car_id FOREIGN KEY (type_car_id)
REFERENCES type_car (id) ON DELETE CASCADE;

DELIMITER $$

--
-- Создать процедуру `proc_add_car`
--
CREATE PROCEDURE proc_add_car (IN _num varchar(255), IN _vin varchar(255), IN _brand int, IN _color int, IN _type_car int, IN _class int, IN _service1 int, IN _service2 int, IN _service3 int)
SQL SECURITY INVOKER
BEGIN
  DECLARE count_id int;
  DECLARE group_services_id int;
  SELECT
    COUNT(id) INTO count_id
  FROM group_services
  WHERE service1 = _service1
  AND CASE WHEN _service2 IS NULL THEN service2 IS NULL ELSE service2 = _service2 END
  AND CASE WHEN _service3 IS NULL THEN service3 IS NULL ELSE service3 = _service3 END;
  IF (count_id = 0) THEN
    INSERT INTO group_services
    SET service1 = _service1,
        service2 = _service2,
        service3 = _service3;
  END IF;
  SELECT
    id INTO group_services_id
  FROM group_services
  WHERE service1 = _service1
  AND CASE WHEN _service2 IS NULL THEN service2 IS NULL ELSE service2 = _service2 END
  AND CASE WHEN _service3 IS NULL THEN service3 IS NULL ELSE service3 = _service3 END;
  INSERT INTO car
  SET num = _num,
      VIN = _vin,
      brand_id = _brand,
      color_id = _color,
      type_car_id = _type_car,
      class_id = _class,
      services_id = group_services_id;
END
$$

DELIMITER ;

--
-- Создать таблицу `driver_car`
--
CREATE TABLE driver_car (
  id int(11) NOT NULL AUTO_INCREMENT,
  driver_id int(11) NOT NULL,
  car_id int(11) NOT NULL,
  data_work date NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 9,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_driver_car` для объекта типа таблица `driver_car`
--
ALTER TABLE driver_car
ADD UNIQUE INDEX UK_driver_car (driver_id, car_id, data_work);

--
-- Создать внешний ключ
--
ALTER TABLE driver_car
ADD CONSTRAINT FK_driver_car_car_id FOREIGN KEY (car_id)
REFERENCES car (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE driver_car
ADD CONSTRAINT FK_driver_car_driver_id FOREIGN KEY (driver_id)
REFERENCES employee (id) ON DELETE CASCADE;

DELIMITER $$

--
-- Создать функцию `func_driver_has_car`
--
CREATE FUNCTION func_driver_has_car (_user_id int)
RETURNS int(11)
SQL SECURITY INVOKER
BEGIN
  DECLARE _id int;
  SELECT
    id INTO _id
  FROM driver_car dc
  WHERE dc.data_work = CURRENT_DATE()
  AND dc.driver_id = (SELECT
      e.id
    FROM user u
      JOIN employee e
        ON u.id = e.user_id
    WHERE u.id = _user_id);
  IF (_id IS NULL) THEN
    RETURN 0;
  ELSE
    RETURN 1;
  END IF;
END
$$

DELIMITER ;

--
-- Создать таблицу `address`
--
CREATE TABLE address (
  id int(11) NOT NULL AUTO_INCREMENT,
  administrative_area varchar(255) NOT NULL,
  city varchar(255) NOT NULL,
  street varchar(255) NOT NULL,
  house_num varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 31,
AVG_ROW_LENGTH = 1260,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_address` для объекта типа таблица `address`
--
ALTER TABLE address
ADD UNIQUE INDEX UK_address (city, street, house_num, administrative_area);

DELIMITER $$

--
-- Создать функцию `func_get_address_id`
--
CREATE FUNCTION func_get_address_id (_adm_area varchar(255), _city varchar(255), _street varchar(255), _house_num varchar(255))
RETURNS int(11)
SQL SECURITY INVOKER
BEGIN
  DECLARE _id int;
  SELECT
    id INTO _id
  FROM address
  WHERE administrative_area = _adm_area
  AND city = _city
  AND street = _street
  AND house_num = _house_num;
  RETURN _id;
END
$$

--
-- Создать процедуру `add_address`
--
CREATE PROCEDURE add_address (IN _adm_area varchar(255), IN _city varchar(255), IN _street varchar(255), IN _house_num varchar(255))
SQL SECURITY INVOKER
BEGIN
  DECLARE count_ int;
  SELECT
    COUNT(id) INTO count_
  FROM address
  WHERE administrative_area = _adm_area
  AND city = _city
  AND street = _street
  AND house_num = _house_num;
  IF (count_ = 0) THEN
    INSERT INTO address
    SET administrative_area = _adm_area,
        city = _city,
        street = _street,
        house_num = _house_num;
  END IF;
END
$$

DELIMITER ;

--
-- Создать таблицу `user_order`
--
CREATE TABLE user_order (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  order_date date NOT NULL,
  order_time time NOT NULL,
  id_address_from int(11) NOT NULL,
  id_address_to int(11) NOT NULL,
  status_id int(11) NOT NULL,
  add_services int(11) DEFAULT NULL,
  class_car int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 15,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_user_order` для объекта типа таблица `user_order`
--
ALTER TABLE user_order
ADD UNIQUE INDEX UK_user_order (user_id, order_date, order_time);

--
-- Создать внешний ключ
--
ALTER TABLE user_order
ADD CONSTRAINT FK_user_order_add_services FOREIGN KEY (add_services)
REFERENCES group_services (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE user_order
ADD CONSTRAINT FK_user_order_class_car FOREIGN KEY (class_car)
REFERENCES class_car (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE user_order
ADD CONSTRAINT FK_user_order_id_address_from FOREIGN KEY (id_address_from)
REFERENCES address (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE user_order
ADD CONSTRAINT FK_user_order_id_address_to FOREIGN KEY (id_address_to)
REFERENCES address (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE user_order
ADD CONSTRAINT FK_user_order_status_id FOREIGN KEY (status_id)
REFERENCES status (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE user_order
ADD CONSTRAINT FK_user_order_user_id FOREIGN KEY (user_id)
REFERENCES user (id) ON DELETE CASCADE;

DELIMITER $$

--
-- Создать процедуру `proc_new_user_order`
--
CREATE PROCEDURE proc_new_user_order (IN _user_id int, IN _id_from int, IN _id_to int, IN _service1 int, IN _service2 int, IN _service3 int, IN _сlass_car int)
SQL SECURITY INVOKER
BEGIN
  DECLARE _status int;
  DECLARE services_id int;
  DECLARE count_id int;
  DECLARE last_order_status int;
  IF !(_service1 IS NULL
    AND _service2 IS NULL
    AND _service3 IS NULL) THEN
    SELECT
      COUNT(id) INTO count_id
    FROM group_services
    WHERE service1 = _service1
    AND CASE WHEN _service2 IS NULL THEN service2 IS NULL ELSE service2 = _service2 END
    AND CASE WHEN _service3 IS NULL THEN service3 IS NULL ELSE service3 = _service3 END;
    IF (count_id = 0) THEN
      INSERT INTO group_services
      SET service1 = _service1,
          service2 = _service2,
          service3 = _service3;
    END IF;
    SELECT
      id INTO services_id
    FROM group_services
    WHERE service1 = _service1
    AND CASE WHEN _service2 IS NULL THEN service2 IS NULL ELSE service2 = _service2 END
    AND CASE WHEN _service3 IS NULL THEN service3 IS NULL ELSE service3 = _service3 END;
  END IF;
  SELECT
    id INTO _status
  FROM status
  WHERE description = 'Зарегистрирован';
  SELECT
    status_id INTO last_order_status
  FROM user_order
  WHERE id = (SELECT
      MAX(id)
    FROM user_order
    WHERE user_id = _user_id
    AND order_date = CURRENT_DATE());
  IF (last_order_status IN (SELECT
        id
      FROM status
      WHERE description = 'Отменен'
      || description = 'Выполнен')
    || last_order_status IS NULL) THEN
    INSERT INTO user_order
    SET user_id = _user_id,
        order_date = CURRENT_DATE(),
        order_time = CURRENT_TIME(),
        id_address_from = _id_from,
        id_address_to = _id_to,
        status_id = _status,
        add_services = services_id,
        class_car = 2;
  END IF;
END
$$

--
-- Создать процедуру `proc_get_car_for_order`
--
CREATE PROCEDURE proc_get_car_for_order (IN user_order_id varchar(255))
SQL SECURITY INVOKER
BEGIN
  DECLARE _service1,
          _service2,
          _service3,
          id_selected_services int;
  SELECT
    add_services INTO id_selected_services
  FROM user_order
  WHERE id = user_order_id;
  SELECT
    service1 INTO _service1
  FROM group_services
  WHERE id = id_selected_services;
  IF _service1 IS NOT NULL THEN
    SELECT
      service2 INTO _service2
    FROM group_services
    WHERE id = id_selected_services;
    SELECT
      service3 INTO _service3
    FROM group_services
    WHERE id = id_selected_services;
    SELECT
      dc.id,
      CONCAT(cb.brand, " ", cb.model, " ", c.num) AS 'car'
    FROM driver_car dc
      JOIN car c
        ON dc.car_id = c.id
      JOIN car_brand cb
        ON c.brand_id = cb.id
      JOIN group_services gs
        ON c.services_id = gs.id
      LEFT JOIN operator_order oo
        ON dc.id = oo.driver_car_id
    WHERE (gs.service1 = _service1
    || gs.service2 = _service1
    || gs.service3 = _service1)
    && CASE WHEN _service2 IS NOT NULL THEN (gs.service1 = _service2
            || gs.service2 = _service2
            || gs.service3 = _service2) ELSE TRUE END
    && CASE WHEN _service3 IS NOT NULL THEN (gs.service1 = _service3
            || gs.service2 = _service3
            || gs.service3 = _service3) ELSE TRUE END
    && dc.data_work = CURRENT_DATE()
    && ((dc.id = oo.driver_car_id
    && oo.time_end_ride IS NOT NULL)
    || oo.driver_car_id IS NULL)
    && c.class_id = (SELECT
        class_car
      FROM user_order
      WHERE id = user_order_id);
  ELSE
    SELECT
      dc.id,
      CONCAT(cb.brand, " ", cb.model, " ", c.num) AS 'car'
    FROM driver_car dc
      JOIN car c
        ON dc.car_id = c.id
      JOIN car_brand cb
        ON c.brand_id = cb.id
      LEFT JOIN operator_order oo
        ON dc.id = oo.driver_car_id
    WHERE dc.data_work = CURRENT_DATE()
    && ((dc.id = oo.driver_car_id
    && oo.time_end_ride IS NOT NULL)
    || oo.driver_car_id IS NULL)
    && c.class_id = (SELECT
        class_car
      FROM user_order
      WHERE id = user_order_id);
  END IF;
END
$$

--
-- Создать процедуру `proc_all_info`
--
CREATE PROCEDURE proc_all_info ()
SQL SECURITY INVOKER
BEGIN
  SELECT
    uo.order_date,
    CONCAT(u.last_name, ' ', u.name, ' ', u.patronymic) AS 'person',
    (CASE WHEN (a1.administrative_area = a1.city) THEN CONCAT(a1.city, ', ', a1.street, ', ', a1.house_num) ELSE CONCAT(a1.administrative_area, ', ', a1.city, ', ', a1.street, ', ', a1.house_num) END) AS 'address_from',
    (CASE WHEN (a2.administrative_area = a2.city) THEN CONCAT(a2.city, ', ', a2.street, ', ', a2.house_num) ELSE CONCAT(a2.administrative_area, ', ', a2.city, ', ', a2.street, ', ', a2.house_num) END) AS 'address_to',
    CONCAT((CASE WHEN ISNULL(gs.service1) THEN ' ' ELSE ads1.service_name END),
    (CASE WHEN ISNULL(gs.service2) THEN '' ELSE CONCAT(', ', ads2.service_name) END),
    (CASE WHEN ISNULL(gs.service3) THEN '' ELSE CONCAT(', ', ads3.service_name) END)) AS 'services',
    s.description,
    CONCAT(u1.last_name, ' ', u1.name, ' ', u1.patronymic) AS 'driver',
    CONCAT(cb.brand, ' ', cb.model, ' - ', c.VIN) AS 'car',
    oo.cost,
    uo.id
  FROM address a1
    JOIN user_order uo
      ON a1.id = uo.id_address_from
    JOIN address a2
      ON a2.id = uo.id_address_to
    LEFT JOIN group_services gs
      ON uo.add_services = gs.id
    LEFT JOIN add_services ads1
      ON gs.service1 = ads1.id
    LEFT JOIN add_services ads2
      ON gs.service2 = ads2.id
    LEFT JOIN add_services ads3
      ON gs.service3 = ads3.id
    JOIN user u
      ON uo.user_id = u.id
    JOIN status s
      ON uo.status_id = s.id
    LEFT JOIN operator_order oo
      ON uo.id = oo.user_order_id
    LEFT JOIN driver_car dc
      ON oo.driver_car_id = dc.id
    LEFT JOIN employee e
      ON e.id = dc.driver_id
    LEFT JOIN user u1
      ON e.user_id = u1.id
    LEFT JOIN car c
      ON dc.car_id = c.id
    LEFT JOIN car_brand cb
      ON cb.id = c.brand_id

  WHERE s.description IN ('Отменен', 'Выполнен')
  ORDER BY uo.order_date;
END
$$

DELIMITER ;

--
-- Создать представление `view_user_orders`
--
CREATE
SQL SECURITY INVOKER
VIEW view_user_orders
AS
SELECT
  `u`.`id` AS `id`,
  `u`.`order_time` AS `time`,
  (CASE WHEN (`a1`.`administrative_area` = `a1`.`city`) THEN CONCAT(`a1`.`city`, ', ', `a1`.`street`, ', ', `a1`.`house_num`) ELSE CONCAT(`a1`.`administrative_area`, ', ', `a1`.`city`, ', ', `a1`.`street`, ', ', `a1`.`house_num`) END) AS `address_from`,
  (CASE WHEN (`a2`.`administrative_area` = `a2`.`city`) THEN CONCAT(`a2`.`city`, ', ', `a2`.`street`, ', ', `a2`.`house_num`) ELSE CONCAT(`a2`.`administrative_area`, ', ', `a2`.`city`, ', ', `a2`.`street`, ', ', `a2`.`house_num`) END) AS `address_to`,
  CONCAT((CASE WHEN ISNULL(`gs`.`service1`) THEN ' ' ELSE `ads1`.`service_name` END), (CASE WHEN ISNULL(`gs`.`service2`) THEN '' ELSE CONCAT(', ', `ads2`.`service_name`) END), (CASE WHEN ISNULL(`gs`.`service3`) THEN '' ELSE CONCAT(', ', `ads3`.`service_name`) END)) AS `services`,
  `cc`.`class_name` AS `car`
FROM (((((((`address` `a1`
  JOIN `user_order` `u`
    ON ((`a1`.`id` = `u`.`id_address_from`)))
  JOIN `address` `a2`
    ON ((`a2`.`id` = `u`.`id_address_to`)))
  LEFT JOIN `group_services` `gs`
    ON ((`u`.`add_services` = `gs`.`id`)))
  LEFT JOIN `add_services` `ads1`
    ON ((`gs`.`service1` = `ads1`.`id`)))
  LEFT JOIN `add_services` `ads2`
    ON ((`gs`.`service2` = `ads2`.`id`)))
  LEFT JOIN `add_services` `ads3`
    ON ((`gs`.`service3` = `ads3`.`id`)))
  JOIN `class_car` `cc`
    ON ((`u`.`class_car` = `cc`.`id`)))
WHERE (`u`.`status_id` = (SELECT
    `status`.`id`
  FROM `status`
  WHERE (`status`.`description` = 'Зарегистрирован')));

--
-- Создать таблицу `operator_order`
--
CREATE TABLE operator_order (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_order_id int(11) NOT NULL,
  driver_car_id int(11) NOT NULL,
  time_wait int(11) NOT NULL,
  time_start_ride time DEFAULT NULL,
  time_end_ride time DEFAULT NULL,
  cost double NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_customer_user_order_id` для объекта типа таблица `operator_order`
--
ALTER TABLE operator_order
ADD UNIQUE INDEX UK_customer_user_order_id (user_order_id);

--
-- Создать внешний ключ
--
ALTER TABLE operator_order
ADD CONSTRAINT FK_customer_driver_car_id FOREIGN KEY (driver_car_id)
REFERENCES driver_car (id) ON DELETE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE operator_order
ADD CONSTRAINT FK_customer_user_order_id FOREIGN KEY (user_order_id)
REFERENCES user_order (id) ON DELETE NO ACTION;

DELIMITER $$

--
-- Создать процедуру `proc_order_for_driver`
--
CREATE PROCEDURE proc_order_for_driver (IN _driver_id varchar(255))
SQL SECURITY INVOKER
BEGIN
  SELECT
    uo.id,
    uo.order_time,
    CONCAT(a1.city, ', ', a1.street, ', ', a1.house_num) AS 'from',
    CONCAT(a2.city, ', ', a2.street, ', ', a2.house_num) AS 'to',
    CONCAT((CASE WHEN ISNULL(gs.service1) THEN ' ' ELSE ads1.service_name END),
    (CASE WHEN ISNULL(gs.service2) THEN '' ELSE CONCAT(', ', ads2.service_name) END),
    (CASE WHEN ISNULL(gs.service3) THEN '' ELSE CONCAT(', ', ads3.service_name) END)) AS 'services'
  FROM operator_order oo
    JOIN user_order uo
      ON oo.user_order_id = uo.id
    JOIN driver_car dc
      ON dc.id = oo.driver_car_id
    JOIN address a1
      ON a1.id = uo.id_address_from
    JOIN address a2
      ON a2.id = uo.id_address_to
    LEFT JOIN group_services gs
      ON uo.add_services = gs.id
    LEFT JOIN add_services ads1
      ON gs.service1 = ads1.id
    LEFT JOIN add_services ads2
      ON gs.service2 = ads2.id
    LEFT JOIN add_services ads3
      ON gs.service3 = ads3.id
    JOIN employee e
      ON e.id = dc.driver_id
  WHERE e.user_id = _driver_id
  AND dc.data_work = CURRENT_DATE()
  AND uo.status_id NOT IN (SELECT
      id
    FROM status
    WHERE description = 'Выполнен'
    || description = 'Отменен');

END
$$

--
-- Создать процедуру `proc_info_to_mail`
--
CREATE PROCEDURE proc_info_to_mail (IN num_order varchar(255))
SQL SECURITY INVOKER
BEGIN
  SELECT
    CONCAT(color.name, ' ', cb.brand, ' ', cb.model, ' с номером ', c.num) AS 'car',
    oo.cost,
    oo.time_wait,
    u.name,
    CONCAT((CASE WHEN ISNULL(gs.service1) THEN ' ' ELSE ads1.service_name END),
    (CASE WHEN ISNULL(gs.service2) THEN '' ELSE CONCAT(', ', ads2.service_name) END),
    (CASE WHEN ISNULL(gs.service3) THEN '' ELSE CONCAT(', ', ads3.service_name) END)) AS 'services',
    cc.class_name AS 'class_car',
    CONCAT(a1.administrative_area, ', ', a1.city, ', ', a1.street, ', ', a1.house_num) AS 'from',
    CONCAT(a2.administrative_area, ', ', a2.city, ', ', a2.street, ', ', a2.house_num) AS 'to',
    u.mail
  FROM operator_order oo
    JOIN user_order uo
      ON oo.user_order_id = uo.id
    JOIN driver_car dc
      ON oo.driver_car_id = dc.id
    JOIN car c
      ON dc.car_id = c.id
    JOIN car_brand cb
      ON cb.id = c.brand_id
    JOIN address a1
      ON a1.id = uo.id_address_from
    JOIN address a2
      ON a2.id = uo.id_address_to
    LEFT JOIN group_services gs
      ON uo.add_services = gs.id
    LEFT JOIN add_services ads1
      ON gs.service1 = ads1.id
    LEFT JOIN add_services ads2
      ON gs.service2 = ads2.id
    LEFT JOIN add_services ads3
      ON gs.service3 = ads3.id
    JOIN class_car cc
      ON cc.id = c.class_id
    JOIN color
      ON color.id = c.color_id
    JOIN user u
      ON u.id = uo.user_id
  WHERE uo.id = num_order;
END
$$

--
-- Создать процедуру `proc_new_user`
--
CREATE PROCEDURE proc_new_user (IN name_ varchar(255), IN last_name_ varchar(255), IN patronymic_ varchar(255), IN login_ varchar(255), IN password_ varchar(255), IN phone_ varchar(255), IN mail_ varchar(255))
SQL SECURITY INVOKER
BEGIN
  DECLARE _role int;
  SELECT
    id INTO _role
  FROM role
  WHERE name = 'user';
  INSERT INTO user
  SET name = name_,
      last_name = last_name_,
      patronymic = patronymic_,
      login = login_,
      password = password_,
      role_id = _role,
      phone = phone_,
      mail = mail_;
END
$$

--
-- Создать процедуру `proc_add_employee`
--
CREATE PROCEDURE proc_add_employee (IN _name varchar(255), IN _last_name varchar(255), IN _patronymic varchar(255), IN _birthdate date, IN _phone varchar(255), IN _mail varchar(255), IN _passport varchar(255), IN _login varchar(255), IN _password varchar(255), IN _num_license varchar(255), IN _role varchar(255))
SQL SECURITY INVOKER
BEGIN
  DECLARE role_ int;
  DECLARE operator_id int;
  SELECT
    id INTO role_
  FROM role
  WHERE name = _role;
  CALL proc_new_user(_name, _last_name, _patronymic, _login, _password, _phone, _mail);
  SELECT
    id INTO operator_id
  FROM user
  WHERE login = _login
  AND password = _password;
  UPDATE user
  SET role_id = role_
  WHERE login = _login
  AND password = _password;
  INSERT INTO employee
  SET user_id = operator_id,
      birth_date = _birthdate,
      passport = _passport,
      num_driver_license = _num_license;
END
$$

DELIMITER ;

-- 
-- Вывод данных для таблицы role
--
INSERT INTO role VALUES
(1, 'admin'),
(3, 'driver'),
(2, 'operator'),
(4, 'user');

-- 
-- Вывод данных для таблицы add_services
--
INSERT INTO add_services VALUES
(1, 'Детское кресло'),
(2, 'Домашнее животное'),
(3, 'Спортивное снаряжение');

-- 
-- Вывод данных для таблицы type_car
--
INSERT INTO type_car VALUES
(9, 'Внедорожник'),
(7, 'Кроссовер'),
(3, 'Купе'),
(5, 'Лимузин'),
(8, 'Минивэн'),
(6, 'Пикап'),
(1, 'Седан'),
(4, 'Универсал'),
(2, 'Хэтчбек');

-- 
-- Вывод данных для таблицы color
--
INSERT INTO color VALUES
(1, 'Бежевый'),
(2, 'Белый'),
(3, 'Голубой'),
(4, 'Жёлтый'),
(5, 'Зелёный'),
(6, 'Коричневый'),
(7, 'Красный'),
(8, 'Оранжевый'),
(9, 'Серебристый'),
(10, 'Серый'),
(11, 'Синий'),
(12, 'Фиолетовый'),
(13, 'Черный');

-- 
-- Вывод данных для таблицы car_brand
--
INSERT INTO car_brand VALUES
(1, 'Acura', 'CL'),
(2, 'Acura', 'EL'),
(3, 'Acura', 'ILX'),
(4, 'Acura', 'Integra'),
(5, 'Acura', 'MDX'),
(6, 'Acura', 'NSX'),
(7, 'Acura', 'RDX'),
(8, 'Acura', 'RL'),
(9, 'Acura', 'RLX'),
(10, 'Acura', 'RSX'),
(11, 'Acura', 'TL'),
(12, 'Acura', 'TLX'),
(13, 'Acura', 'TSX'),
(14, 'Acura', 'ZDX'),
(15, 'Alfa Romeo', '146'),
(16, 'Alfa Romeo', '147'),
(17, 'Alfa Romeo', '147 GTA'),
(18, 'Alfa Romeo', '156'),
(19, 'Alfa Romeo', '156 GTA'),
(20, 'Alfa Romeo', '159'),
(21, 'Alfa Romeo', '166'),
(22, 'Alfa Romeo', '4C'),
(23, 'Alfa Romeo', '8C Competizione'),
(24, 'Alfa Romeo', 'Brera'),
(25, 'Alfa Romeo', 'Giulia'),
(26, 'Alfa Romeo', 'Giulietta'),
(27, 'Alfa Romeo', 'GT'),
(28, 'Alfa Romeo', 'GTV'),
(29, 'Alfa Romeo', 'MiTo'),
(30, 'Alfa Romeo', 'Spider'),
(31, 'Alfa Romeo', 'Stelvio'),
(32, 'Aston Martin', 'Cygnet'),
(33, 'Aston Martin', 'DB11'),
(34, 'Aston Martin', 'DB9'),
(35, 'Aston Martin', 'DBS'),
(36, 'Aston Martin', 'DBS Violante'),
(37, 'Aston Martin', 'DBX'),
(38, 'Aston Martin', 'Rapide'),
(39, 'Aston Martin', 'V12 Vantage'),
(40, 'Aston Martin', 'V8 Vantage'),
(41, 'Aston Martin', 'Valkyrie'),
(42, 'Aston Martin', 'Vanquish'),
(43, 'Aston Martin', 'Virage'),
(44, 'Aston Martin', 'Zagato Coupe'),
(45, 'Audi', 'A1'),
(46, 'Audi', 'A2'),
(47, 'Audi', 'A3'),
(48, 'Audi', 'A4'),
(49, 'Audi', 'A4 Allroad Quattro'),
(50, 'Audi', 'A5'),
(51, 'Audi', 'A6'),
(52, 'Audi', 'A7'),
(53, 'Audi', 'A8'),
(54, 'Audi', 'Allroad'),
(55, 'Audi', 'E-Tron'),
(56, 'Audi', 'Q2'),
(57, 'Audi', 'Q3'),
(58, 'Audi', 'Q5'),
(59, 'Audi', 'Q7'),
(60, 'Audi', 'Q8'),
(61, 'Audi', 'R8'),
(62, 'Audi', 'RS Q3'),
(63, 'Audi', 'RS3'),
(64, 'Audi', 'RS4'),
(65, 'Audi', 'RS5'),
(66, 'Audi', 'RS6'),
(67, 'Audi', 'RS7'),
(68, 'Audi', 'S3'),
(69, 'Audi', 'S4'),
(70, 'Audi', 'S5'),
(71, 'Audi', 'S6'),
(72, 'Audi', 'S7'),
(73, 'Audi', 'S8'),
(74, 'Audi', 'SQ2'),
(75, 'Audi', 'SQ5'),
(76, 'Audi', 'SQ7'),
(77, 'Audi', 'SQ8'),
(78, 'Audi', 'TT'),
(79, 'Audi', 'TT RS'),
(80, 'Audi', 'TTS'),
(81, 'Bentley', 'Arnage'),
(82, 'Bentley', 'Azure'),
(83, 'Bentley', 'Bentayga'),
(84, 'Bentley', 'Brooklands'),
(85, 'Bentley', 'Continental'),
(86, 'Bentley', 'Continental Flying Spur'),
(87, 'Bentley', 'Continental GT'),
(88, 'Bentley', 'Flying Spur'),
(89, 'Bentley', 'Mulsanne'),
(90, 'BMW', '1 series'),
(91, 'BMW', '2 series'),
(92, 'BMW', '3 series'),
(93, 'BMW', '4 series'),
(94, 'BMW', '5 series'),
(95, 'BMW', '6 series'),
(96, 'BMW', '7 series'),
(97, 'BMW', '8 series'),
(98, 'BMW', 'i3'),
(99, 'BMW', 'i8'),
(100, 'BMW', 'M2'),
(101, 'BMW', 'M3'),
(102, 'BMW', 'M4'),
(103, 'BMW', 'M5'),
(104, 'BMW', 'M6'),
(105, 'BMW', 'X1'),
(106, 'BMW', 'X2'),
(107, 'BMW', 'X3'),
(108, 'BMW', 'X3 M'),
(109, 'BMW', 'X4'),
(110, 'BMW', 'X4 M'),
(111, 'BMW', 'X5'),
(112, 'BMW', 'X5 M'),
(113, 'BMW', 'X6'),
(114, 'BMW', 'X6 M'),
(115, 'BMW', 'X7'),
(116, 'BMW', 'Z3'),
(117, 'BMW', 'Z4'),
(118, 'BMW', 'Z8'),
(119, 'Brilliance', 'H230'),
(120, 'Brilliance', 'V3'),
(121, 'Brilliance', 'V5'),
(122, 'Bugatti', 'Veyron'),
(123, 'Buick', 'Century'),
(124, 'Buick', 'Enclave'),
(125, 'Buick', 'Envision'),
(126, 'Buick', 'La Crosse'),
(127, 'Buick', 'Le Sabre'),
(128, 'Buick', 'Lucerne'),
(129, 'Buick', 'Park Avenue'),
(130, 'Buick', 'Rainier'),
(131, 'Buick', 'Regal'),
(132, 'Buick', 'Rendezvouz'),
(133, 'Buick', 'Terraza'),
(134, 'Buick', 'Verano'),
(135, 'BYD', 'Qin'),
(136, 'Cadillac', 'ATS'),
(137, 'Cadillac', 'ATS-V'),
(138, 'Cadillac', 'BLS'),
(139, 'Cadillac', 'CT6'),
(140, 'Cadillac', 'CTS'),
(141, 'Cadillac', 'De Ville'),
(142, 'Cadillac', 'DTS'),
(143, 'Cadillac', 'Eldorado'),
(144, 'Cadillac', 'ELR'),
(145, 'Cadillac', 'Escalade'),
(146, 'Cadillac', 'Seville'),
(147, 'Cadillac', 'SRX'),
(148, 'Cadillac', 'STS'),
(149, 'Cadillac', 'XLR'),
(150, 'Cadillac', 'XT4'),
(151, 'Cadillac', 'XT5'),
(152, 'Cadillac', 'XT6'),
(153, 'Cadillac', 'XTS'),
(154, 'Changan', 'CS35'),
(155, 'Changan', 'CS35 Plus'),
(156, 'Changan', 'CS55'),
(157, 'Changan', 'CS75'),
(158, 'Changan', 'CS95'),
(159, 'Changan', 'Eado'),
(160, 'Changan', 'Raeton'),
(161, 'Chery', 'Amulet'),
(162, 'Chery', 'Arrizo 7'),
(163, 'Chery', 'Bonus'),
(164, 'Chery', 'Bonus 3'),
(165, 'Chery', 'CrossEastar'),
(166, 'Chery', 'Eastar'),
(167, 'Chery', 'Fora'),
(168, 'Chery', 'IndiS'),
(169, 'Chery', 'Kimo'),
(170, 'Chery', 'M11'),
(171, 'Chery', 'QQ'),
(172, 'Chery', 'QQ6'),
(173, 'Chery', 'Tiggo'),
(174, 'Chery', 'Tiggo 3'),
(175, 'Chery', 'Tiggo 4'),
(176, 'Chery', 'Tiggo 5'),
(177, 'Chery', 'Tiggo 7'),
(178, 'Chery', 'Tiggo 8'),
(179, 'Chery', 'Very'),
(180, 'Chevrolet', 'Astro'),
(181, 'Chevrolet', 'Avalanche'),
(182, 'Chevrolet', 'Aveo'),
(183, 'Chevrolet', 'Blazer'),
(184, 'Chevrolet', 'Camaro'),
(185, 'Chevrolet', 'Captiva'),
(186, 'Chevrolet', 'Cavalier'),
(187, 'Chevrolet', 'Cobalt'),
(188, 'Chevrolet', 'Colorado'),
(189, 'Chevrolet', 'Corvette'),
(190, 'Chevrolet', 'Cruze'),
(191, 'Chevrolet', 'Epica'),
(192, 'Chevrolet', 'Equinox'),
(193, 'Chevrolet', 'Express'),
(194, 'Chevrolet', 'HHR'),
(195, 'Chevrolet', 'Impala'),
(196, 'Chevrolet', 'Lacetti'),
(197, 'Chevrolet', 'Lanos'),
(198, 'Chevrolet', 'Malibu'),
(199, 'Chevrolet', 'Monte Carlo'),
(200, 'Chevrolet', 'Niva'),
(201, 'Chevrolet', 'Orlando'),
(202, 'Chevrolet', 'Rezzo'),
(203, 'Chevrolet', 'Silverado'),
(204, 'Chevrolet', 'Silverado 2500 HD'),
(205, 'Chevrolet', 'Spark'),
(206, 'Chevrolet', 'SSR'),
(207, 'Chevrolet', 'Suburban'),
(208, 'Chevrolet', 'Tahoe'),
(209, 'Chevrolet', 'TrailBlazer'),
(210, 'Chevrolet', 'Traverse'),
(211, 'Chevrolet', 'Trax'),
(212, 'Chevrolet', 'Uplander'),
(213, 'Chevrolet', 'Venture'),
(214, 'Chrysler', '200'),
(215, 'Chrysler', '300'),
(216, 'Chrysler', '300M'),
(217, 'Chrysler', 'Aspen'),
(218, 'Chrysler', 'Concorde'),
(219, 'Chrysler', 'Crossfire'),
(220, 'Chrysler', 'Grand Voyager'),
(221, 'Chrysler', 'Pacifica'),
(222, 'Chrysler', 'PT Cruiser'),
(223, 'Chrysler', 'Sebring'),
(224, 'Chrysler', 'Town & Country'),
(225, 'Chrysler', 'Voyager'),
(226, 'Citroen', 'Berlingo'),
(227, 'Citroen', 'C-Crosser'),
(228, 'Citroen', 'C-Elysee'),
(229, 'Citroen', 'C1'),
(230, 'Citroen', 'C2'),
(231, 'Citroen', 'C3'),
(232, 'Citroen', 'C3 Aircross'),
(233, 'Citroen', 'C3 Picasso'),
(234, 'Citroen', 'C3 Pluriel'),
(235, 'Citroen', 'C4'),
(236, 'Citroen', 'C4 Aircross'),
(237, 'Citroen', 'C4 Cactus'),
(238, 'Citroen', 'C4 Picasso'),
(239, 'Citroen', 'C5'),
(240, 'Citroen', 'C6'),
(241, 'Citroen', 'C8'),
(242, 'Citroen', 'DS 7 Crossback'),
(243, 'Citroen', 'DS3'),
(244, 'Citroen', 'DS4'),
(245, 'Citroen', 'DS5'),
(246, 'Citroen', 'Grand C4 Picasso'),
(247, 'Citroen', 'Jumpy'),
(248, 'Citroen', 'Nemo'),
(249, 'Citroen', 'Saxo'),
(250, 'Citroen', 'Spacetourer'),
(251, 'Citroen', 'Xsara'),
(252, 'Citroen', 'Xsara Picasso'),
(253, 'Daewoo', 'Evanda'),
(254, 'Daewoo', 'Kalos'),
(255, 'Daewoo', 'Leganza'),
(256, 'Daewoo', 'Magnus'),
(257, 'Daewoo', 'Matiz'),
(258, 'Daewoo', 'Nexia'),
(259, 'Daewoo', 'Nubira'),
(260, 'Daihatsu', 'Applause'),
(261, 'Daihatsu', 'Cast'),
(262, 'Daihatsu', 'Copen'),
(263, 'Daihatsu', 'Cuore'),
(264, 'Daihatsu', 'Gran Move'),
(265, 'Daihatsu', 'Luxio'),
(266, 'Daihatsu', 'Materia'),
(267, 'Daihatsu', 'Mebius'),
(268, 'Daihatsu', 'Move'),
(269, 'Daihatsu', 'Rocky'),
(270, 'Daihatsu', 'Sirion'),
(271, 'Daihatsu', 'Terios'),
(272, 'Daihatsu', 'Trevis'),
(273, 'Daihatsu', 'YRV'),
(274, 'Datsun', 'mi-DO'),
(275, 'Datsun', 'on-DO'),
(276, 'Dodge', 'Avenger'),
(277, 'Dodge', 'Caliber'),
(278, 'Dodge', 'Caliber SRT4'),
(279, 'Dodge', 'Caravan'),
(280, 'Dodge', 'Challenger'),
(281, 'Dodge', 'Charger'),
(282, 'Dodge', 'Dakota'),
(283, 'Dodge', 'Dart'),
(284, 'Dodge', 'Durango'),
(285, 'Dodge', 'Intrepid'),
(286, 'Dodge', 'Journey'),
(287, 'Dodge', 'Magnum'),
(288, 'Dodge', 'Neon'),
(289, 'Dodge', 'Nitro'),
(290, 'Dodge', 'Ram 1500'),
(291, 'Dodge', 'Ram 2500'),
(292, 'Dodge', 'Ram 3500'),
(293, 'Dodge', 'Ram SRT10'),
(294, 'Dodge', 'Stratus'),
(295, 'Dodge', 'Viper'),
(296, 'Dongfeng', '580'),
(297, 'Dongfeng', 'A30'),
(298, 'Dongfeng', 'AX7'),
(299, 'Dongfeng', 'H30 Cross'),
(300, 'FAW', 'Besturn B30'),
(301, 'FAW', 'Besturn B50'),
(302, 'FAW', 'Besturn X40'),
(303, 'FAW', 'Besturn X80'),
(304, 'FAW', 'Oley'),
(305, 'FAW', 'Vita'),
(306, 'Ferrari', '348'),
(307, 'Ferrari', '360'),
(308, 'Ferrari', '456'),
(309, 'Ferrari', '458'),
(310, 'Ferrari', '488'),
(311, 'Ferrari', '512'),
(312, 'Ferrari', '550'),
(313, 'Ferrari', '575 M'),
(314, 'Ferrari', '599 GTB Fiorano'),
(315, 'Ferrari', '599 GTO'),
(316, 'Ferrari', '612'),
(317, 'Ferrari', '812'),
(318, 'Ferrari', 'California'),
(319, 'Ferrari', 'California T'),
(320, 'Ferrari', 'Challenge Stradale'),
(321, 'Ferrari', 'Enzo'),
(322, 'Ferrari', 'F12'),
(323, 'Ferrari', 'F355'),
(324, 'Ferrari', 'F430'),
(325, 'Ferrari', 'F50'),
(326, 'Ferrari', 'F512 M'),
(327, 'Ferrari', 'FF'),
(328, 'Ferrari', 'GTC4 Lusso'),
(329, 'Ferrari', 'LaFerrari'),
(330, 'Fiat', '124 Spider'),
(331, 'Fiat', '500'),
(332, 'Fiat', '500L'),
(333, 'Fiat', '500X'),
(334, 'Fiat', 'Albea'),
(335, 'Fiat', 'Brava'),
(336, 'Fiat', 'Bravo'),
(337, 'Fiat', 'Coupe'),
(338, 'Fiat', 'Croma'),
(339, 'Fiat', 'Doblo'),
(340, 'Fiat', 'Ducato'),
(341, 'Fiat', 'Freemont'),
(342, 'Fiat', 'Grande Punto'),
(343, 'Fiat', 'Idea'),
(344, 'Fiat', 'Linea'),
(345, 'Fiat', 'Marea'),
(346, 'Fiat', 'Multipla'),
(347, 'Fiat', 'Palio'),
(348, 'Fiat', 'Panda'),
(349, 'Fiat', 'Panda 4x4'),
(350, 'Fiat', 'Punto'),
(351, 'Fiat', 'Qubo'),
(352, 'Fiat', 'Sedici'),
(353, 'Fiat', 'Siena'),
(354, 'Fiat', 'Stilo'),
(355, 'Fiat', 'Strada'),
(356, 'Fiat', 'Tipo'),
(357, 'Fiat', 'Ulysse'),
(358, 'Fisker', 'Karma'),
(359, 'Ford', 'B-Max'),
(360, 'Ford', 'C-Max'),
(361, 'Ford', 'Cougar'),
(362, 'Ford', 'Crown Victoria'),
(363, 'Ford', 'EcoSport'),
(364, 'Ford', 'Edge'),
(365, 'Ford', 'Escape'),
(366, 'Ford', 'Excursion'),
(367, 'Ford', 'Expedition'),
(368, 'Ford', 'Explorer'),
(369, 'Ford', 'Explorer Sport Trac'),
(370, 'Ford', 'F-150'),
(371, 'Ford', 'F-250'),
(372, 'Ford', 'F-350'),
(373, 'Ford', 'Falcon'),
(374, 'Ford', 'Fiesta'),
(375, 'Ford', 'Five Hundred'),
(376, 'Ford', 'Flex'),
(377, 'Ford', 'Focus'),
(378, 'Ford', 'Focus Active'),
(379, 'Ford', 'Freestar'),
(380, 'Ford', 'Freestyle'),
(381, 'Ford', 'Fusion'),
(382, 'Ford', 'Galaxy'),
(383, 'Ford', 'Ka'),
(384, 'Ford', 'Kuga'),
(385, 'Ford', 'Maverick'),
(386, 'Ford', 'Mondeo'),
(387, 'Ford', 'Mustang'),
(388, 'Ford', 'Mustang Shelby GT350'),
(389, 'Ford', 'Mustang Shelby GT500'),
(390, 'Ford', 'Puma'),
(391, 'Ford', 'Ranger'),
(392, 'Ford', 'S-Max'),
(393, 'Ford', 'Taurus'),
(394, 'Ford', 'Taurus X'),
(395, 'Ford', 'Thunderbird'),
(396, 'Ford', 'Tourneo Connect'),
(397, 'Ford', 'Transit'),
(398, 'Ford', 'Transit Connect'),
(399, 'GAZ', '3102'),
(400, 'GAZ', '31105'),
(401, 'GAZ', 'Siber'),
(402, 'GAZ', 'Sobol'),
(403, 'Geely', 'Atlas'),
(404, 'Geely', 'Coolray'),
(405, 'Geely', 'Emgrand 7'),
(406, 'Geely', 'Emgrand EC7'),
(407, 'Geely', 'Emgrand GS'),
(408, 'Geely', 'Emgrand X7'),
(409, 'Geely', 'GC9'),
(410, 'Geely', 'GС6'),
(411, 'Geely', 'MK'),
(412, 'Geely', 'Otaka'),
(413, 'Geely', 'Vision'),
(414, 'Genesis', 'G70'),
(415, 'Genesis', 'G80'),
(416, 'Genesis', 'G90'),
(417, 'GMC', 'Acadia'),
(418, 'GMC', 'Canyon'),
(419, 'GMC', 'Envoy'),
(420, 'GMC', 'Sierra 1500'),
(421, 'GMC', 'Sierra 2500'),
(422, 'GMC', 'Terrain'),
(423, 'GMC', 'Yukon'),
(424, 'Great Wall', 'Cowry'),
(425, 'Great Wall', 'Deer'),
(426, 'Great Wall', 'Hover'),
(427, 'Great Wall', 'Hover M2'),
(428, 'Great Wall', 'Pegasus'),
(429, 'Great Wall', 'Peri'),
(430, 'Great Wall', 'Safe'),
(431, 'Great Wall', 'Sailor'),
(432, 'Great Wall', 'Sing'),
(433, 'Great Wall', 'Socool'),
(434, 'Great Wall', 'Wingle'),
(435, 'Haval', 'F7'),
(436, 'Haval', 'H4'),
(437, 'Haval', 'H6'),
(438, 'Haval', 'H9'),
(439, 'Holden', 'Commodore'),
(440, 'Honda', 'Accord'),
(441, 'Honda', 'Amaze'),
(442, 'Honda', 'City'),
(443, 'Honda', 'Civic'),
(444, 'Honda', 'CR-V'),
(445, 'Honda', 'CR-Z'),
(446, 'Honda', 'Crosstour'),
(447, 'Honda', 'Element'),
(448, 'Honda', 'Fit'),
(449, 'Honda', 'FR-V'),
(450, 'Honda', 'HR-V'),
(451, 'Honda', 'HR-V II (GJ)'),
(452, 'Honda', 'Insight'),
(453, 'Honda', 'Jade'),
(454, 'Honda', 'Jazz'),
(455, 'Honda', 'Legend'),
(456, 'Honda', 'Odyssey'),
(457, 'Honda', 'Pilot'),
(458, 'Honda', 'Prelude'),
(459, 'Honda', 'Ridgeline'),
(460, 'Honda', 'S2000'),
(461, 'Honda', 'Shuttle'),
(462, 'Honda', 'Stream'),
(463, 'Honda', 'Vezel'),
(464, 'Hummer', 'H1'),
(465, 'Hummer', 'H2'),
(466, 'Hummer', 'H3'),
(467, 'Hyundai', 'Accent'),
(468, 'Hyundai', 'Atos Prime'),
(469, 'Hyundai', 'Azera'),
(470, 'Hyundai', 'Centennial'),
(471, 'Hyundai', 'Creta'),
(472, 'Hyundai', 'Elantra'),
(473, 'Hyundai', 'Entourage'),
(474, 'Hyundai', 'Eon'),
(475, 'Hyundai', 'Equus'),
(476, 'Hyundai', 'Galloper'),
(477, 'Hyundai', 'Genesis'),
(478, 'Hyundai', 'Genesis Coupe'),
(479, 'Hyundai', 'Getz'),
(480, 'Hyundai', 'Grandeur'),
(481, 'Hyundai', 'H-1'),
(482, 'Hyundai', 'i10'),
(483, 'Hyundai', 'i20'),
(484, 'Hyundai', 'i30'),
(485, 'Hyundai', 'i30 N'),
(486, 'Hyundai', 'i40'),
(487, 'Hyundai', 'Ioniq'),
(488, 'Hyundai', 'ix20'),
(489, 'Hyundai', 'ix35'),
(490, 'Hyundai', 'Kona'),
(491, 'Hyundai', 'Matrix'),
(492, 'Hyundai', 'Palisade'),
(493, 'Hyundai', 'Porter'),
(494, 'Hyundai', 'Santa Fe'),
(495, 'Hyundai', 'Solaris'),
(496, 'Hyundai', 'Sonata'),
(497, 'Hyundai', 'Terracan'),
(498, 'Hyundai', 'Trajet'),
(499, 'Hyundai', 'Tucson'),
(500, 'Hyundai', 'Veloster'),
(501, 'Hyundai', 'Veracruz'),
(502, 'Hyundai', 'Verna'),
(503, 'Hyundai', 'Xcent'),
(504, 'Hyundai', 'XG'),
(505, 'Infiniti', 'EX'),
(506, 'Infiniti', 'FX'),
(507, 'Infiniti', 'G'),
(508, 'Infiniti', 'I35'),
(509, 'Infiniti', 'JX'),
(510, 'Infiniti', 'M'),
(511, 'Infiniti', 'Q30'),
(512, 'Infiniti', 'Q40'),
(513, 'Infiniti', 'Q45'),
(514, 'Infiniti', 'Q50'),
(515, 'Infiniti', 'Q60'),
(516, 'Infiniti', 'Q70'),
(517, 'Infiniti', 'QX30'),
(518, 'Infiniti', 'QX4'),
(519, 'Infiniti', 'QX50'),
(520, 'Infiniti', 'QX56'),
(521, 'Infiniti', 'QX60'),
(522, 'Infiniti', 'QX70'),
(523, 'Infiniti', 'QX80'),
(524, 'Isuzu', 'Ascender'),
(525, 'Isuzu', 'Axiom'),
(526, 'Isuzu', 'D-Max'),
(527, 'Isuzu', 'D-Max Rodeo'),
(528, 'Isuzu', 'I280'),
(529, 'Isuzu', 'I290'),
(530, 'Isuzu', 'I350'),
(531, 'Isuzu', 'I370'),
(532, 'Isuzu', 'Rodeo'),
(533, 'Isuzu', 'Trooper'),
(534, 'Isuzu', 'VehiCross'),
(535, 'Iveco', 'Daily'),
(536, 'Jaguar', 'E-Pace'),
(537, 'Jaguar', 'F-Pace'),
(538, 'Jaguar', 'F-Type'),
(539, 'Jaguar', 'I-Pace'),
(540, 'Jaguar', 'S-Type'),
(541, 'Jaguar', 'X-Type'),
(542, 'Jaguar', 'XE'),
(543, 'Jaguar', 'XF'),
(544, 'Jaguar', 'XJ'),
(545, 'Jaguar', 'XK/XKR'),
(546, 'Jeep', 'Cherokee'),
(547, 'Jeep', 'Commander'),
(548, 'Jeep', 'Compass'),
(549, 'Jeep', 'Gladiator'),
(550, 'Jeep', 'Grand Cherokee'),
(551, 'Jeep', 'Liberty'),
(552, 'Jeep', 'Patriot'),
(553, 'Jeep', 'Renegade'),
(554, 'Jeep', 'Wrangler'),
(555, 'Kia', 'Carens'),
(556, 'Kia', 'Carnival'),
(557, 'Kia', 'Ceed'),
(558, 'Kia', 'Cerato'),
(559, 'Kia', 'Clarus'),
(560, 'Kia', 'Forte'),
(561, 'Kia', 'K900'),
(562, 'Kia', 'Magentis'),
(563, 'Kia', 'Mohave'),
(564, 'Kia', 'Niro'),
(565, 'Kia', 'Opirus'),
(566, 'Kia', 'Optima'),
(567, 'Kia', 'Picanto'),
(568, 'Kia', 'ProCeed'),
(569, 'Kia', 'Quoris'),
(570, 'Kia', 'Ray'),
(571, 'Kia', 'Rio'),
(572, 'Kia', 'Rio X-Line'),
(573, 'Kia', 'Seltos'),
(574, 'Kia', 'Shuma'),
(575, 'Kia', 'Sorento'),
(576, 'Kia', 'Sorento Prime'),
(577, 'Kia', 'Soul'),
(578, 'Kia', 'Spectra'),
(579, 'Kia', 'Sportage'),
(580, 'Kia', 'Stinger'),
(581, 'Kia', 'Stonic'),
(582, 'Kia', 'Telluride'),
(583, 'Kia', 'Venga'),
(1057, 'LADA', '110, 111, 112'),
(1055, 'LADA', '2101-2107'),
(1059, 'LADA', '4x4 Urban'),
(1060, 'LADA', 'Granta'),
(1069, 'LADA', 'Kalina'),
(1061, 'LADA', 'Largus'),
(1062, 'LADA', 'Largus Cross'),
(1070, 'LADA', 'Niva 4X4'),
(1071, 'LADA', 'OKA'),
(1072, 'LADA', 'Proiora'),
(1056, 'LADA', 'Samara-1'),
(1058, 'LADA', 'Samara-2'),
(1068, 'LADA', 'Vesta'),
(1063, 'LADA', 'Vesta Cross'),
(1064, 'LADA', 'Vesta Sport'),
(1065, 'LADA', 'Vesta SW'),
(1066, 'LADA', 'XRay'),
(1067, 'LADA', 'XRay Cross'),
(584, 'Lamborghini', 'Aventador'),
(585, 'Lamborghini', 'Centenario'),
(586, 'Lamborghini', 'Diablo'),
(587, 'Lamborghini', 'Gallardo'),
(588, 'Lamborghini', 'Huracan'),
(589, 'Lamborghini', 'Murcielago'),
(590, 'Lamborghini', 'Reventon'),
(591, 'Lamborghini', 'Urus'),
(592, 'Lancia', 'Delta'),
(593, 'Lancia', 'Lybra'),
(594, 'Lancia', 'Musa'),
(595, 'Lancia', 'Phedra'),
(596, 'Lancia', 'Thema'),
(597, 'Lancia', 'Thesis'),
(598, 'Lancia', 'Ypsilon'),
(599, 'Land Rover', 'Defender'),
(600, 'Land Rover', 'Discovery'),
(601, 'Land Rover', 'Discovery Sport'),
(602, 'Land Rover', 'Evoque'),
(603, 'Land Rover', 'Freelander'),
(604, 'Land Rover', 'Range Rover'),
(605, 'Land Rover', 'Range Rover Sport'),
(606, 'Land Rover', 'Range Rover Velar'),
(607, 'Lexus', 'CT'),
(608, 'Lexus', 'ES'),
(609, 'Lexus', 'GS'),
(610, 'Lexus', 'GX'),
(611, 'Lexus', 'HS'),
(612, 'Lexus', 'IS'),
(613, 'Lexus', 'LC'),
(614, 'Lexus', 'LFA'),
(615, 'Lexus', 'LS'),
(616, 'Lexus', 'LX'),
(617, 'Lexus', 'NX'),
(618, 'Lexus', 'RC'),
(619, 'Lexus', 'RX'),
(620, 'Lexus', 'SC'),
(621, 'Lexus', 'UX'),
(622, 'Lifan', 'Breez'),
(623, 'Lifan', 'Cebrium'),
(624, 'Lifan', 'Celliya'),
(625, 'Lifan', 'Smily'),
(626, 'Lifan', 'Solano'),
(627, 'Lifan', 'X50'),
(628, 'Lifan', 'X60'),
(629, 'Lincoln', 'Aviator'),
(630, 'Lincoln', 'Corsair'),
(631, 'Lincoln', 'Mark LT'),
(632, 'Lincoln', 'MKC'),
(633, 'Lincoln', 'MKS'),
(634, 'Lincoln', 'MKT'),
(635, 'Lincoln', 'MKX'),
(636, 'Lincoln', 'MKZ'),
(637, 'Lincoln', 'Navigator'),
(638, 'Lincoln', 'Town Car'),
(639, 'Lincoln', 'Zephyr'),
(640, 'Lotus', 'Elise'),
(641, 'Lotus', 'Europa S'),
(642, 'Lotus', 'Evora'),
(643, 'Lotus', 'Exige'),
(644, 'Marussia', 'B1'),
(645, 'Marussia', 'B2'),
(646, 'Maserati', '3200 GT'),
(647, 'Maserati', 'Ghibli'),
(648, 'Maserati', 'Gran Cabrio'),
(649, 'Maserati', 'Gran Turismo '),
(650, 'Maserati', 'Gran Turismo S'),
(651, 'Maserati', 'Levante'),
(652, 'Maserati', 'Quattroporte'),
(653, 'Maserati', 'Quattroporte S'),
(654, 'Maybach', '57'),
(655, 'Maybach', '57 S'),
(656, 'Maybach', '62'),
(657, 'Maybach', '62 S'),
(658, 'Maybach', 'Landaulet'),
(659, 'Mazda', '2'),
(660, 'Mazda', '3'),
(661, 'Mazda', '323'),
(662, 'Mazda', '5'),
(663, 'Mazda', '6'),
(664, 'Mazda', '626'),
(665, 'Mazda', 'B-Series'),
(666, 'Mazda', 'BT-50'),
(667, 'Mazda', 'CX-3'),
(668, 'Mazda', 'CX-5'),
(669, 'Mazda', 'CX-7'),
(670, 'Mazda', 'CX-9'),
(671, 'Mazda', 'MPV'),
(672, 'Mazda', 'MX-5'),
(673, 'Mazda', 'Premacy'),
(674, 'Mazda', 'RX-7'),
(675, 'Mazda', 'RX-8'),
(676, 'Mazda', 'Tribute'),
(677, 'McLaren', '540C'),
(678, 'McLaren', '570S'),
(679, 'McLaren', '600LT'),
(680, 'McLaren', '650S'),
(681, 'McLaren', '675LT'),
(682, 'McLaren', '720S'),
(683, 'McLaren', 'MP4-12C'),
(684, 'McLaren', 'P1'),
(685, 'Mercedes', 'A-class'),
(686, 'Mercedes', 'AMG GT'),
(687, 'Mercedes', 'AMG GT 4-Door'),
(688, 'Mercedes', 'B-class'),
(689, 'Mercedes', 'C-class'),
(690, 'Mercedes', 'C-class Sport Coupe'),
(691, 'Mercedes', 'CL-class'),
(692, 'Mercedes', 'CLA-class'),
(693, 'Mercedes', 'CLC-class '),
(694, 'Mercedes', 'CLK-class'),
(695, 'Mercedes', 'CLS-class'),
(696, 'Mercedes', 'E-class'),
(697, 'Mercedes', 'E-class Coupe'),
(698, 'Mercedes', 'EQC'),
(699, 'Mercedes', 'G-class'),
(700, 'Mercedes', 'GL-class'),
(701, 'Mercedes', 'GLA-class'),
(702, 'Mercedes', 'GLB-class'),
(703, 'Mercedes', 'GLC-class'),
(704, 'Mercedes', 'GLC-class Coupe'),
(705, 'Mercedes', 'GLE-class'),
(706, 'Mercedes', 'GLE-class Coupe'),
(707, 'Mercedes', 'GLK-class'),
(708, 'Mercedes', 'GLS-class'),
(709, 'Mercedes', 'M-class'),
(710, 'Mercedes', 'R-class'),
(711, 'Mercedes', 'S-class'),
(712, 'Mercedes', 'S-class Cabrio'),
(713, 'Mercedes', 'S-class Coupe'),
(714, 'Mercedes', 'SL-class'),
(715, 'Mercedes', 'SLK-class'),
(716, 'Mercedes', 'SLR-class'),
(717, 'Mercedes', 'SLS AMG'),
(718, 'Mercedes', 'Sprinter'),
(719, 'Mercedes', 'Vaneo'),
(720, 'Mercedes', 'Viano'),
(721, 'Mercedes', 'Vito'),
(722, 'Mercedes', 'X-class'),
(723, 'Mercury', 'Grand Marquis'),
(724, 'Mercury', 'Mariner'),
(725, 'Mercury', 'Milan'),
(726, 'Mercury', 'Montego'),
(727, 'Mercury', 'Monterey'),
(728, 'Mercury', 'Mountaineer'),
(729, 'Mercury', 'Sable'),
(730, 'MG', 'TF'),
(731, 'MG', 'XPower SV'),
(732, 'MG', 'ZR'),
(733, 'MG', 'ZS'),
(734, 'MG', 'ZT'),
(735, 'MG', 'ZT-T'),
(736, 'Mini', 'Clubman'),
(737, 'Mini', 'Clubman S'),
(738, 'Mini', 'Clubvan'),
(739, 'Mini', 'Cooper'),
(740, 'Mini', 'Cooper Cabrio'),
(741, 'Mini', 'Cooper S'),
(742, 'Mini', 'Cooper S Cabrio'),
(743, 'Mini', 'Cooper S Countryman All4'),
(744, 'Mini', 'Countryman'),
(745, 'Mini', 'One'),
(746, 'Mitsubishi', '3000 GT'),
(747, 'Mitsubishi', 'ASX'),
(748, 'Mitsubishi', 'Carisma'),
(749, 'Mitsubishi', 'Colt'),
(750, 'Mitsubishi', 'Dignity'),
(751, 'Mitsubishi', 'Eclipse'),
(752, 'Mitsubishi', 'Eclipse Cross'),
(753, 'Mitsubishi', 'Endeavor'),
(754, 'Mitsubishi', 'Galant'),
(755, 'Mitsubishi', 'Grandis'),
(756, 'Mitsubishi', 'i-MiEV'),
(757, 'Mitsubishi', 'L200'),
(758, 'Mitsubishi', 'Lancer'),
(759, 'Mitsubishi', 'Lancer Evo'),
(760, 'Mitsubishi', 'Mirage'),
(761, 'Mitsubishi', 'Outlander'),
(762, 'Mitsubishi', 'Outlander XL'),
(763, 'Mitsubishi', 'Pajero'),
(764, 'Mitsubishi', 'Pajero Pinin'),
(765, 'Mitsubishi', 'Pajero Sport'),
(766, 'Mitsubishi', 'Raider'),
(767, 'Mitsubishi', 'Space Gear'),
(768, 'Mitsubishi', 'Space Runner'),
(769, 'Mitsubishi', 'Space Star'),
(770, 'Nissan', '350Z'),
(771, 'Nissan', '370Z'),
(772, 'Nissan', 'Almera'),
(773, 'Nissan', 'Almera Classic'),
(774, 'Nissan', 'Almera Tino'),
(775, 'Nissan', 'Altima'),
(776, 'Nissan', 'Armada'),
(777, 'Nissan', 'Bluebird Sylphy'),
(778, 'Nissan', 'GT-R'),
(779, 'Nissan', 'Juke'),
(780, 'Nissan', 'Leaf'),
(781, 'Nissan', 'Maxima'),
(782, 'Nissan', 'Micra'),
(783, 'Nissan', 'Murano'),
(784, 'Nissan', 'Navara'),
(785, 'Nissan', 'Note'),
(786, 'Nissan', 'NP300'),
(787, 'Nissan', 'Pathfinder'),
(788, 'Nissan', 'Patrol'),
(789, 'Nissan', 'Primera'),
(790, 'Nissan', 'Qashqai'),
(791, 'Nissan', 'Qashqai+2'),
(792, 'Nissan', 'Quest'),
(793, 'Nissan', 'Rogue'),
(794, 'Nissan', 'Sentra'),
(795, 'Nissan', 'Skyline'),
(796, 'Nissan', 'Sylphy'),
(797, 'Nissan', 'Teana'),
(798, 'Nissan', 'Terrano'),
(799, 'Nissan', 'Tiida'),
(800, 'Nissan', 'Titan'),
(801, 'Nissan', 'Titan XD'),
(802, 'Nissan', 'X-Trail'),
(803, 'Nissan', 'XTerra'),
(804, 'Nissan', 'Z'),
(805, 'Noble', 'M600'),
(806, 'Opel', 'Adam'),
(807, 'Opel', 'Agila'),
(808, 'Opel', 'Antara'),
(809, 'Opel', 'Astra'),
(810, 'Opel', 'Astra GTS'),
(811, 'Opel', 'Cascada'),
(812, 'Opel', 'Combo'),
(813, 'Opel', 'Corsa'),
(814, 'Opel', 'Corsa OPC'),
(815, 'Opel', 'Crossland X'),
(816, 'Opel', 'Frontera'),
(817, 'Opel', 'Grandland X'),
(818, 'Opel', 'Insignia'),
(819, 'Opel', 'Insignia OPC'),
(820, 'Opel', 'Karl'),
(821, 'Opel', 'Meriva'),
(822, 'Opel', 'Mokka'),
(823, 'Opel', 'Omega'),
(824, 'Opel', 'Signum'),
(825, 'Opel', 'Speedster'),
(826, 'Opel', 'Tigra'),
(827, 'Opel', 'Vectra'),
(828, 'Opel', 'Vivaro'),
(829, 'Opel', 'Zafira'),
(830, 'Opel', 'Zafira Tourer'),
(831, 'Peugeot', '1007'),
(832, 'Peugeot', '107'),
(833, 'Peugeot', '108'),
(834, 'Peugeot', '2008'),
(835, 'Peugeot', '206'),
(836, 'Peugeot', '207'),
(837, 'Peugeot', '208'),
(838, 'Peugeot', '3008'),
(839, 'Peugeot', '301'),
(840, 'Peugeot', '307'),
(841, 'Peugeot', '308'),
(842, 'Peugeot', '4007'),
(843, 'Peugeot', '4008'),
(844, 'Peugeot', '406'),
(845, 'Peugeot', '407'),
(846, 'Peugeot', '408'),
(847, 'Peugeot', '5008'),
(848, 'Peugeot', '508'),
(849, 'Peugeot', '607'),
(850, 'Peugeot', '807'),
(851, 'Peugeot', 'Boxer'),
(852, 'Peugeot', 'Partner'),
(853, 'Peugeot', 'RCZ Sport'),
(854, 'Plymouth', 'Road Runner'),
(855, 'Pontiac', 'Aztec'),
(856, 'Pontiac', 'Bonneville'),
(857, 'Pontiac', 'Firebird'),
(858, 'Pontiac', 'G5 Pursuit'),
(859, 'Pontiac', 'G6'),
(860, 'Pontiac', 'G8'),
(861, 'Pontiac', 'Grand AM'),
(862, 'Pontiac', 'Grand Prix'),
(863, 'Pontiac', 'GTO'),
(864, 'Pontiac', 'Montana'),
(865, 'Pontiac', 'Solstice'),
(866, 'Pontiac', 'Sunfire'),
(867, 'Pontiac', 'Torrent'),
(868, 'Pontiac', 'Vibe'),
(869, 'Porsche', '718 Boxster'),
(870, 'Porsche', '718 Cayman'),
(871, 'Porsche', '911'),
(872, 'Porsche', 'Boxster'),
(873, 'Porsche', 'Cayenne'),
(874, 'Porsche', 'Cayman'),
(875, 'Porsche', 'Macan'),
(876, 'Porsche', 'Panamera'),
(877, 'Porsche', 'Taycan'),
(878, 'Ravon', 'Gentra'),
(879, 'Renault', 'Arkana'),
(880, 'Renault', 'Avantime'),
(881, 'Renault', 'Captur'),
(882, 'Renault', 'Clio'),
(883, 'Renault', 'Duster'),
(884, 'Renault', 'Duster Oroch'),
(885, 'Renault', 'Espace'),
(886, 'Renault', 'Fluence'),
(887, 'Renault', 'Grand Scenic'),
(888, 'Renault', 'Kadjar'),
(889, 'Renault', 'Kangoo'),
(890, 'Renault', 'Kaptur'),
(891, 'Renault', 'Koleos'),
(892, 'Renault', 'Laguna'),
(893, 'Renault', 'Latitude'),
(894, 'Renault', 'Logan'),
(895, 'Renault', 'Master'),
(896, 'Renault', 'Megane'),
(897, 'Renault', 'Modus'),
(898, 'Renault', 'Sandero'),
(899, 'Renault', 'Sandero Stepway'),
(900, 'Renault', 'Scenic'),
(901, 'Renault', 'Symbol'),
(902, 'Renault', 'Talisman'),
(903, 'Renault', 'Trafic'),
(904, 'Renault', 'Twingo'),
(905, 'Renault', 'Twizy'),
(906, 'Renault', 'Vel Satis'),
(907, 'Renault', 'Wind'),
(908, 'Renault', 'Zoe'),
(909, 'Rolls-Royce', 'Cullinan'),
(910, 'Rolls-Royce', 'Dawn'),
(911, 'Rolls-Royce', 'Ghost'),
(912, 'Rolls-Royce', 'Phantom'),
(913, 'Rolls-Royce', 'Wraith'),
(914, 'Rover', '25'),
(915, 'Rover', '400'),
(916, 'Rover', '45'),
(917, 'Rover', '600'),
(918, 'Rover', '75'),
(919, 'Rover', 'Streetwise'),
(923, 'Saab', '09.май'),
(921, 'Saab', '09.мар'),
(920, 'Saab', '9-2x'),
(922, 'Saab', '9-4x'),
(924, 'Saab', '9-7x'),
(925, 'Saturn', 'Aura'),
(926, 'Saturn', 'Ion'),
(927, 'Saturn', 'LW'),
(928, 'Saturn', 'Outlook'),
(929, 'Saturn', 'Sky'),
(930, 'Saturn', 'Vue'),
(931, 'Scion', 'FR-S'),
(932, 'Scion', 'tC'),
(933, 'Scion', 'xA'),
(934, 'Scion', 'xB'),
(935, 'Scion', 'xD'),
(936, 'Seat', 'Alhambra'),
(937, 'Seat', 'Altea'),
(938, 'Seat', 'Altea Freetrack'),
(939, 'Seat', 'Altea XL'),
(940, 'Seat', 'Arosa'),
(941, 'Seat', 'Ateca'),
(942, 'Seat', 'Cordoba'),
(943, 'Seat', 'Exeo'),
(944, 'Seat', 'Ibiza'),
(945, 'Seat', 'Leon'),
(946, 'Seat', 'Mii'),
(947, 'Seat', 'Toledo'),
(948, 'Skoda', 'Citigo'),
(949, 'Skoda', 'Fabia'),
(950, 'Skoda', 'Felicia'),
(951, 'Skoda', 'Kamiq'),
(952, 'Skoda', 'Karoq'),
(953, 'Skoda', 'Kodiaq'),
(954, 'Skoda', 'Octavia'),
(955, 'Skoda', 'Octavia Scout'),
(956, 'Skoda', 'Octavia Tour'),
(957, 'Skoda', 'Praktik'),
(958, 'Skoda', 'Rapid'),
(959, 'Skoda', 'Rapid Spaceback (NH1)'),
(960, 'Skoda', 'Roomster'),
(961, 'Skoda', 'Superb'),
(962, 'Skoda', 'Yeti'),
(963, 'Smart', 'Forfour'),
(964, 'Smart', 'Fortwo'),
(965, 'Smart', 'Roadster'),
(966, 'Ssang Yong', 'Actyon'),
(967, 'Ssang Yong', 'Actyon Sports'),
(968, 'Ssang Yong', 'Chairman'),
(969, 'Ssang Yong', 'Korando'),
(970, 'Ssang Yong', 'Kyron'),
(971, 'Ssang Yong', 'Musso'),
(972, 'Ssang Yong', 'Musso Sport'),
(973, 'Ssang Yong', 'Rexton'),
(974, 'Ssang Yong', 'Rodius'),
(975, 'Ssang Yong', 'Stavic'),
(976, 'Ssang Yong', 'Tivoli'),
(977, 'Ssang Yong', 'XLV'),
(978, 'Subaru', 'Ascent'),
(979, 'Subaru', 'Baja'),
(980, 'Subaru', 'Crosstrack'),
(981, 'Subaru', 'Exiga'),
(982, 'Subaru', 'Forester'),
(983, 'Subaru', 'Impreza'),
(984, 'Subaru', 'Justy'),
(985, 'Subaru', 'Legacy'),
(986, 'Subaru', 'Levorg'),
(987, 'Subaru', 'Outback'),
(988, 'Subaru', 'Traviq'),
(989, 'Subaru', 'Tribeca'),
(990, 'Subaru', 'WRX'),
(991, 'Subaru', 'XV'),
(992, 'Suzuki', 'Alto'),
(993, 'Suzuki', 'Baleno'),
(994, 'Suzuki', 'Celerio'),
(995, 'Suzuki', 'Ciaz'),
(996, 'Suzuki', 'Grand Vitara'),
(997, 'Suzuki', 'Grand Vitara XL7'),
(998, 'Suzuki', 'Ignis'),
(999, 'Suzuki', 'Jimny'),
(1000, 'Suzuki', 'Kizashi'),
(1001, 'Suzuki', 'Liana'),
(1002, 'Suzuki', 'Splash'),
(1003, 'Suzuki', 'Swift'),
(1004, 'Suzuki', 'SX4'),
(1005, 'Suzuki', 'Vitara'),
(1006, 'Suzuki', 'Wagon R'),
(1007, 'Suzuki', 'Wagon R+'),
(1008, 'Tesla', 'Model 3'),
(1009, 'Tesla', 'Model S'),
(1010, 'Tesla', 'Model X'),
(1011, 'Tesla', 'Model Y'),
(1012, 'Toyota', '4Runner'),
(1013, 'Toyota', 'Alphard'),
(1014, 'Toyota', 'Auris'),
(1015, 'Toyota', 'Avalon'),
(1016, 'Toyota', 'Avensis'),
(1017, 'Toyota', 'Avensis Verso'),
(1018, 'Toyota', 'Aygo'),
(1019, 'Toyota', 'C-HR'),
(1020, 'Toyota', 'Caldina'),
(1021, 'Toyota', 'Camry'),
(1022, 'Toyota', 'Celica'),
(1023, 'Toyota', 'Corolla'),
(1024, 'Toyota', 'Corolla Verso'),
(1025, 'Toyota', 'FJ Cruiser'),
(1026, 'Toyota', 'Fortuner'),
(1027, 'Toyota', 'GT 86'),
(1028, 'Toyota', 'Hiace'),
(1029, 'Toyota', 'Highlander'),
(1030, 'Toyota', 'Hilux'),
(1031, 'Toyota', 'iQ'),
(1032, 'Toyota', 'ist'),
(1033, 'Toyota', 'Land Cruiser'),
(1034, 'Toyota', 'Land Cruiser Prado'),
(1035, 'Toyota', 'Mark II'),
(1036, 'Toyota', 'Mirai'),
(1037, 'Toyota', 'MR2'),
(1038, 'Toyota', 'Picnic'),
(1039, 'Toyota', 'Previa'),
(1040, 'Toyota', 'Prius'),
(1041, 'Toyota', 'RAV4'),
(1042, 'Toyota', 'Sequoia'),
(1043, 'Toyota', 'Sienna'),
(1044, 'Toyota', 'Supra'),
(1045, 'Toyota', 'Tacoma'),
(1046, 'Toyota', 'Tundra'),
(1047, 'Toyota', 'Venza'),
(1048, 'Toyota', 'Verso'),
(1049, 'Toyota', 'Vitz'),
(1050, 'Toyota', 'Yaris'),
(1051, 'Toyota', 'Yaris Verso'),
(1054, 'UAZ', 'Hunter'),
(1053, 'UAZ', 'Patriot'),
(1052, 'UAZ', 'Pickup'),
(1073, 'Volkswagen', 'Amarok'),
(1074, 'Volkswagen', 'Arteon'),
(1075, 'Volkswagen', 'Beetle'),
(1076, 'Volkswagen', 'Bora'),
(1077, 'Volkswagen', 'Caddy'),
(1078, 'Volkswagen', 'CC'),
(1079, 'Volkswagen', 'Crafter'),
(1080, 'Volkswagen', 'CrossGolf'),
(1081, 'Volkswagen', 'CrossPolo'),
(1082, 'Volkswagen', 'CrossTouran'),
(1083, 'Volkswagen', 'Eos'),
(1084, 'Volkswagen', 'Fox'),
(1085, 'Volkswagen', 'Golf'),
(1086, 'Volkswagen', 'Jetta'),
(1087, 'Volkswagen', 'Lupo'),
(1088, 'Volkswagen', 'Multivan'),
(1089, 'Volkswagen', 'New Beetle'),
(1090, 'Volkswagen', 'Passat'),
(1091, 'Volkswagen', 'Passat CC'),
(1092, 'Volkswagen', 'Phaeton'),
(1093, 'Volkswagen', 'Pointer'),
(1094, 'Volkswagen', 'Polo'),
(1095, 'Volkswagen', 'Routan'),
(1096, 'Volkswagen', 'Scirocco'),
(1097, 'Volkswagen', 'Sharan'),
(1098, 'Volkswagen', 'T-Roc'),
(1099, 'Volkswagen', 'Teramont'),
(1100, 'Volkswagen', 'Tiguan'),
(1101, 'Volkswagen', 'Touareg'),
(1102, 'Volkswagen', 'Touran'),
(1103, 'Volkswagen', 'Transporter'),
(1104, 'Volkswagen', 'Up'),
(1105, 'Volvo', 'C30'),
(1106, 'Volvo', 'C70'),
(1107, 'Volvo', 'C70 Convertible'),
(1108, 'Volvo', 'C70 Coupe'),
(1109, 'Volvo', 'S40'),
(1110, 'Volvo', 'S60'),
(1111, 'Volvo', 'S70'),
(1112, 'Volvo', 'S80'),
(1113, 'Volvo', 'S90'),
(1114, 'Volvo', 'V40'),
(1115, 'Volvo', 'V50'),
(1116, 'Volvo', 'V60'),
(1117, 'Volvo', 'V70'),
(1118, 'Volvo', 'V90'),
(1119, 'Volvo', 'XC40'),
(1120, 'Volvo', 'XC60'),
(1121, 'Volvo', 'XC70'),
(1122, 'Volvo', 'XC90');

-- 
-- Вывод данных для таблицы user
--
INSERT INTO user VALUES
(7, 'Мария', 'Берестова', 'Алексеевна', 'marushka', '74d65d378c4bc018ddb7445c74f9f677', 4, '89058752076', 'berestova_ma@mail.ru'),
(8, 'Наталья', 'Берестова', 'Владимировна', 'mama', '88a2b92b03602bd58b7ff391ce0be401', 4, '89090545354', 'mama@mail.tu'),
(9, 'Павел', 'Мячин', 'Сергеевич', 'pavel', '299902807d34eb3c27d132bc89d2e6d6', 4, '89120186230', 'pavel@mail.tu'),
(10, 'Татьяна', 'Берестова', 'Алексеевна', 'admin', 'c3284d0f94606de1fd2af172aba15bf3', 1, '89043122650', 'berestova_tanya-28@mail.ru'),
(11, 'Алиса', 'Петрова', 'Алексеевна', 'alisa', 'e8756114b8172b47f2b790fc08e46dd4', 4, '89998998989', 'alisa@gmail.com'),
(12, 'Елена', 'Комарова', 'Викторовна', 'elka', 'd9b1d7db4cd6e70935368a1efb10e377', 4, '89090123423', 'ekom@yandex.ru'),
(13, 'Алина', 'Левусенкова', 'Сергеевна', 'alina', 'e24d3d6725cff625205ea36c75dbd103', 4, '89123335432', 'alina@mail.ru'),
(22, 'Алексей', 'Берестов', 'Александрович', 'papa', 'c872b2d2f5f229499592e2554538e7c2', 3, '89090599521', 'papa@gmail.com'),
(25, 'Георгий', 'Носов', 'Павлович', 'georgii', '111d4f739d13eb3ed040773e02c63c9a', 3, '89123213432', 'georgii@mail.ru'),
(35, 'Марат', 'Соколов', 'Александрович', 'marat', '46f9aa61d79c1538321752a329317966', 2, '89058752071', 'marat@gmail.com'),
(36, 'Андрей', 'Петров', 'Сергеевич', 'andrey', 'a5b84ea6bd49f2d59c6654359b81885b', 3, '89053131670', 'andrey_andrey@mail.ru'),
(37, 'Александр', 'Смирнов', 'Сергеевич', 'alex', '6f876c56df96a8db87b81a67f38ed083', 3, '89120001245', 'alex@yandex.com'),
(38, 'Иван', 'Андреевич', 'Кошкин', 'ivan', 'e176882943849981a7ffb23d7ee8f625', 3, '88129071324', 'ivanuska@yande.com');

-- 
-- Вывод данных для таблицы status
--
INSERT INTO status VALUES
(4, 'Выполнен'),
(1, 'Зарегистрирован'),
(2, 'Назначен водитель'),
(5, 'Отменен'),
(3, 'Принят');

-- 
-- Вывод данных для таблицы group_services
--
INSERT INTO group_services VALUES
(6, 1, NULL, NULL),
(5, 1, 2, NULL),
(11, 1, 2, 3),
(7, 2, NULL, NULL),
(9, 2, 3, NULL),
(10, 3, NULL, NULL);

-- 
-- Вывод данных для таблицы class_car
--
INSERT INTO class_car VALUES
(4, 'Бизнес'),
(2, 'Комфорт'),
(5, 'Люкс'),
(6, 'Минивэн'),
(3, 'Премиум'),
(1, 'Эконом');

-- 
-- Вывод данных для таблицы address
--
INSERT INTO address VALUES
(24, 'Санкт-Петербург', 'Санкт-Петербург', 'Невский проспект', '88'),
(30, 'Санкт-Петербург', 'Санкт-Петербург', 'Невский проспект', '90-92'),
(28, 'Санкт-Петербург', 'Санкт-Петербург', 'площадь Чернышевского', '11'),
(20, 'Санкт-Петербург', 'Санкт-Петербург', 'Политехническая улица', '1'),
(25, 'Санкт-Петербург', 'Санкт-Петербург', 'Политехническая улица', '24'),
(26, 'Санкт-Петербург', 'Санкт-Петербург', 'Политехническая улица', '29'),
(27, 'Санкт-Петербург', 'Санкт-Петербург', 'Политехническая улица', '9'),
(23, 'Санкт-Петербург', 'Санкт-Петербург', 'проспект Ветеранов', '122'),
(22, 'Санкт-Петербург', 'Санкт-Петербург', 'проспект Ветеранов', '130'),
(29, 'Санкт-Петербург', 'Санкт-Петербург', 'проспект Ветеранов', '171к5'),
(21, 'Санкт-Петербург', 'Санкт-Петербург', 'проспект Просвещения', '1'),
(14, 'Санкт-Петербург', 'Санкт-Петербург', 'улица Харченко', '16'),
(2, 'Санкт-Петербург', 'Санкт-Петербург', 'улица Хлопина', '11к1');

-- 
-- Вывод данных для таблицы employee
--
INSERT INTO employee VALUES
(6, 22, '1972-01-21', '1234121212', '9327121111'),
(9, 25, '1982-03-01', '1212343434', '8767123344'),
(15, 35, '2021-04-26', '1234121222', NULL),
(16, 36, '1989-06-09', '1786334410', '8451335180'),
(17, 37, '1978-05-17', '3465128812', '9865431879'),
(18, 38, '1991-09-24', '1546322332', '9834124543');

-- 
-- Вывод данных для таблицы car
--
INSERT INTO car VALUES
(6, 'A476AA', 'XW8ZZZ61ZCGO60342', 1094, 2, 1, 5, 6),
(7, 'B576BB', 'WAUZZZ48ZWNO49087', 71, 13, 4, 2, 9),
(8, 'C334CC', 'WDD22148ZWNO49087', 713, 9, 3, 5, 10),
(9, 'C431BA', 'WOLOXCF0653057009', 812, 6, 8, 6, 11),
(10, 'A125KO', 'KNEMB754276126842', 556, 11, 8, 6, 9),
(11, 'K312CC', 'XW8AN4NE2GH00915', 954, 4, 1, 2, 11),
(12, 'E214ET', 'XW7BF4FK70S126800', 1021, 7, 1, 4, 11),
(13, 'E494TO', 'SALLNAAA82A342363', 600, 13, 9, 3, 5),
(14, 'C994AC', 'Z94CU41DBDR2374', 571, 2, 2, 1, 11),
(15, 'B119AA', 'Z94CU41DABR001070', 495, 4, 2, 1, 5),
(16, 'A198AA', 'SCBGT3ZA6GC055616\r\n', 85, 10, 3, 5, 5),
(17, 'E439MM', 'SCA1S68014UX00198', 912, 9, 1, 5, 11);

-- 
-- Вывод данных для таблицы user_order
--
INSERT INTO user_order VALUES
(2, 9, '2021-05-10', '22:59:55', 23, 24, 5, 5, 1),
(4, 9, '2021-05-12', '20:33:38', 25, 14, 5, 7, 2),
(8, 13, '2021-05-17', '12:47:18', 2, 24, 4, NULL, 5),
(9, 11, '2021-05-13', '00:16:48', 2, 24, 5, NULL, 3),
(10, 11, '2021-05-17', '00:22:16', 2, 24, 4, 10, 2),
(14, 13, '2021-05-17', '21:45:04', 2, 20, 1, 9, 2);

-- 
-- Вывод данных для таблицы driver_car
--
INSERT INTO driver_car VALUES
(3, 6, 6, '2021-05-17'),
(1, 6, 8, '2021-05-13'),
(4, 9, 7, '2021-05-16'),
(2, 15, 8, '2021-05-16'),
(8, 16, 7, '2021-05-17');

-- 
-- Вывод данных для таблицы operator_order
--
INSERT INTO operator_order VALUES
(1, 8, 3, 12, '18:10:58', '18:17:04', 350),
(2, 10, 8, 10, '21:08:06', '21:18:08', 400);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;