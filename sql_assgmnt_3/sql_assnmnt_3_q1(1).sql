
-- 1. Create a function and then call another function from within it. What is this process called?

-- process is called nested function

CREATE DEFINER=`root`@`localhost` PROCEDURE `call_child`(a int )
BEGIN
select child (a);
END

