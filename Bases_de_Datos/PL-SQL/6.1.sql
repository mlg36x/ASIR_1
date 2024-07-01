DELIMITER $$
DROP PROCEDURE IF EXISTS fecha $$
CREATE PROCEDURE fecha()
LANGUAGE SQL
NOT DETERMINISTIC
COMMENT 'Un procedimiento'
SELECT CURRENT_DATE
$$

-------------------------------------------------------------------------

SET @variable_usuario = 0;
/*De sesión si quieres que solo la use un usuario y global todos*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sumar_uno $$
CREATE PROCEDURE sumar_uno(inout x int)
BEGIN
SET x= x+1;
SELECT x;
END;
$$
call sumar_uno(@variable_usuario);

-------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS tresletras $$
CREATE PROCEDURE tresletras(IN palabra varchar(255))
LANGUAGE SQL
NOT DETERMINISTIC
SELECT UPPER(SUBSTRING(palabra, 1,3))
END;
$$

-------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS concat2 $$
CREATE PROCEDURE concat2(IN palabra1 varchar(255), IN palabra2 varchar(255))
BEGIN
	DECLARE concatenacion varchar(510);
    SET concatenacion = UPPER(concat(palabra1, palabra2));
    SELECT concatenacion;
END;
$$

-------------------------------------------------------------------------

DELIMITER $$
DROP FUNCTION IF EXISTS hipotenusa $$
CREATE FUNCTION hipotenusa(a FLOAT, b FLOAT)
RETURNS FLOAT
BEGIN
DECLARE hipotenusa FLOAT;
SET hipotenusa= ((x^2 + y^2)^0.5); /* pow(x,2) */
RETURN hipotenusa;
END;
$$

-------------------------------------------------------------------------

DELIMITER $$
DROP FUNCTION puntos $$
CREATE FUNCTION puntos (resultado varchar(7))
RETURNS INT
BEGIN
DECLARE local INT;
DECLARE visitante INT;
DECLARE total INT;
SUBSTRING_INDEX(resultado,'-',1) /* -1 para la dcha */
END;