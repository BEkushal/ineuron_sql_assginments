
-- 1. Create a function and then call another function from within it. What is this process called?

-- process is called nested function


CREATE DEFINER=`root`@`localhost` FUNCTION `child`(c int) RETURNS int
    DETERMINISTIC
begin
declare p int;
set p = c + 15;
RETURN p;
END

