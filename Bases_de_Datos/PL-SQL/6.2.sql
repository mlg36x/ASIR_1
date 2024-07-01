DELIMITER $$
DROP FUNCTION IF EXISTS divisible $$
CREATE FUNCTION divisible(numero_a INT, numero_b INT)
RETURNS INT
COMMENT "Devuelve 0 si el número a es divisible por b, y 1 si no lo es"
BEGIN
DECLARE division INT;
SET division = numero_a MOD numero_b;
IF division = 0 THEN
RETURN 1;
ELSE
RETURN 0;
END IF;
END;
$$
select divisible(4, 2)

---------------------------------------------------------------------------------

DELIMITER $$ 
DROP PROCEDURE IF EXISTS diasemana $$
CREATE PROCEDURE diasemana(IN numero INT)
LANGUAGE SQL
NOT DETERMINISTIC
IF numero = 1 then
SELECT "El dia de la semana es lunes";
ELSEIF numero = 2 then
SELECT "El dia de la semana es martes";
ELSEIF numero = 3 then
SELECT "El dia de la semana es miercoles";
ELSEIF numero = 4 then
SELECT "El dia de la semana es jueves";
ELSEIF numero = 5 then
SELECT "El dia de la semana es viernes";
ELSEIF numero = 6 then
SELECT "El dia de la semana es sabado";
ELSEIF numero = 7 then
SELECT "El dia de la semana es domingo";
ELSEIF numero not in (1,2,3,4,5,6,7) then
SELECT "El dia de la semana es jueves";
END IF;
END;
$$

---------------------------------------------------------------------------------

DELIMITER $$
DROP FUNCTION IF EXISTS mayorque $$
CREATE FUNCTION mayorque(a INT, b INT, c INT)
RETURNS VARCHAR(40)
BEGIN
DECLARE mayor1 INT;
DECLARE final INT;
IF a > b then 
SET mayor1 = a;
ELSE set mayor1 = b;
END IF;
IF mayor1 > c then 
SET final = mayor1;
ELSE SET final = c;
END IF;
RETURN concat("El número mas grande es: ", final);
END;
$$
---------------------------------------------------------------------------------
use liga;
DELIMITER $$
DROP FUNCTION IF EXISTS ganalocal $$
CREATE FUNCTION ganalocal(ID_partido INT(11))
RETURNS BOOLEAN
BEGIN
DECLARE resultado VARCHAR(45);
SET resultado = (SELECT resultado from partido WHERE id_partido = ID_partido);
IF SUBSTRING_INDEX(resultado, "-", -1) > SUBSTRING_INDEX(resultado, "-", 1) then 
RETURN TRUE;
ELSE 
RETURN FALSE;
END IF;
END;
$$ 
select ganalocal(1);
---------------------------------------------------------------------------------

DELIMITER $$
DROP function IF EXISTS palindroma $$
CREATE FUNCTION palindroma(frase VARCHAR(255))
RETURNS BOOLEAN
BEGIN
DECLARE inversa varchar(255);
SET inversa = reverse(frase);
IF reverse(frase) = inversa then
RETURN true;
ELSE
RETURN false;
END IF;
END;
$$

---------------------------------------------------------------------------------

CREATE table values(

)
