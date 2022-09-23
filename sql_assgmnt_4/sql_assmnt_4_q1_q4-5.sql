-- 1. Explain different types of views. Demonstrate with suitable examples.


create database assignment_4;
use assignment_4;

CREATE TABLE sales (
    sales_id       INT 
  , product_name   VARCHAR(128) NOT NULL
  , product_price  INT NOT NULL
  , quantity INT NOT NULL
);

select * from sales


INSERT INTO sales VALUES  (1, 'Apple', 125, 1),(1, 'Apple', 240, 2),(1, 'Apple', 405, 3), 
(2, 'Pear', 630, 2), (2, 'Pear', 1220, 4), (3, 'Plum', 485, 3);

-- 'UPDATABLE VIEW EXAMPLE

create view sales_view as 
select product_name, quantity from sales;
select * from sales_view
update sales_view set quantity = 5 where product_name = 'plum'
update sales_view set quantity = 3 where product_name = 'plum'

-- 'READ ONLY VIEW EXAMPLE'

create view read_only as 
select product_name, sum(quantity) as product_count from sales group by product_name
select * from read_only
update read_only set product_count = 5 where product_name = 'plum'

-- 'MATERIALISTIC VIEW EXAMPLE'

CREATE TABLE sales_new (
sales_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_name   VARCHAR(128) NOT NULL, 
product_price  DECIMAL(8,2) NOT NULL,
product_amount SMALLINT     NOT NULL);

INSERT INTO sales_new VALUES
  (NULL, 'Apple', 1.25, 1), (NULL, 'Apple', 2.40, 2)
, (NULL, 'Apple', 4.05, 3), (NULL, 'Pear', 6.30, 2)
, (NULL, 'Pear', 12.20, 4), (NULL, 'Plum', 4.85, 3)
;

SELECT * FROM sales_new;

SELECT product_name,
SUM(product_price) AS price_sum, 
SUM(product_amount) AS amount_sum,
AVG(product_price) AS price_avg, 
AVG(product_amount) AS amount_agg,
COUNT(*)
FROM sales_new GROUP BY product_name ORDER BY price_sum
 
 CREATE TABLE sales_mv (
    product_name VARCHAR(128)  NOT NULL,
    price_sum    DECIMAL(10,2) NOT NULL,
    amount_sum   INT           NOT NULL,
    price_avg    FLOAT         NOT NULL,
    amount_avg   FLOAT         NOT NULL,
    sales_cnt    INT           NOT NULL,
    UNIQUE INDEX product (product_name));

INSERT INTO sales_mv
SELECT product_name, SUM(product_price), SUM(product_amount),
 AVG(product_price), AVG(product_amount), COUNT(*)
FROM sales_new GROUP BY product_name;

SELECT * FROM sales_mv;

-- 4.	Showcase an example of exception handling in SQL stored procedure.

CREATE TABLE SupplierProducts (
    supplierId INT,
    productId INT,
    PRIMARY KEY (supplierId , productId)
);

delimiter $$

CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
 	SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$

DELIMITER ;

CALL InsertSupplierProduct(1,1);-- message returned terminating stored procedure
CALL InsertSupplierProduct(1,2);-- message returned terminating stored procedure
CALL InsertSupplierProduct(1,3);-- message returned terminating stored procedure
CALL InsertSupplierProduct(1,5);-- message returned terminating stored procedure

-- changing the handler to continue will completely execute the stored procedure.
DROP PROCEDURE IF EXISTS InsertSupplierProduct;

DELIMITER $$

CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$
DELIMITER ;

CALL InsertSupplierProduct(1,3);

-- 5. Create a SQL function to split strings into rows on a given character? 
-- Input String: Stephen;peter;berry;Olivier;caroline;


create table t( txt text );
insert into t values('Stephen;peter;berry;Olivier;caroline;');


create temporary table temp( val char(255) );
set @sql = concat("insert into temp (val) values ('", replace(( select group_concat(distinct txt) as data from t), ";", "'),('"),"');");
prepare stmt1 from @sql;
execute stmt1;
select distinct(val) from temp;



     