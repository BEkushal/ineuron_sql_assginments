CREATE DEFINER=`root`@`localhost` PROCEDURE `register`()
BEGIN
CREATE TABLE customer (a INT, b CHAR (20), INDEX (a));
START TRANSACTION;
INSERT INTO customer VALUES (10, 'Heikki');
 COMMIT;
SET autocommit=0;


INSERT INTO customer VALUES (15, 'John');
INSERT INTO customer VALUES (20, 'Paul');
DELETE FROM customer WHERE b = 'Heikki';
ROLLBACK;

SELECT * FROM customer;
END