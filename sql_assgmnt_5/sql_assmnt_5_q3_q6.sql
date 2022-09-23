

-- 3. Give an example of the derived table.

drop database assignment_5;
create database assignment_5;
use  assignment_5;
CREATE TABLE t1 (s1 INT, s2 CHAR(5), s3 FLOAT);

INSERT INTO t1 VALUES (1,'1',1.0);
INSERT INTO t1 VALUES (2,'2',2.0);
SELECT sb1,sb2,sb3
  FROM (SELECT s1 AS sb1, s2 AS sb2, s3*2 AS sb3 FROM t1) AS sb
  WHERE sb1 > 1;
  
-- 6. Create a stored procedure to call other stored procedures.

DELIMITER $$

CREATE TABLE animals (
     id MEDIUMINT NOT NULL AUTO_INCREMENT,
     name CHAR(30) NOT NULL,
     PRIMARY KEY (id)
) $$

DELIMITER $$
CREATE PROCEDURE sp1()
BEGIN
  insert into animals (name) values ('bear');
END $$

DELIMITER $$
CREATE PROCEDURE sp2()
BEGIN
  call sp1;
  select * from animals;
END $$

call sp2;
