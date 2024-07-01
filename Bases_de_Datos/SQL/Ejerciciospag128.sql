/*Ejercicio 1 página 128*/
/*Apartado a*/
SELECT titulo AS titulo
from libro as lib
WHERE (
        aniopublicacion BETWEEN 1926 AND 1978
    )
    AND (EditorialID != 32);
/*Apartado b*/
SELECT concat(s.Nombre, ' ', s.Apellidos) AS 'Nombre Completo',
    s.Alta
from socio as s
WHERE YEAR(s.Alta) >= 2009
    AND s.Direccion IS NOT NULL
ORDER BY s.Alta DESC;
/*Apartado c*/
SELECT DISTINCT p.PaisID as 'Código País'
from pais as p
    INNER JOIN editorial as e ON p.PaisID = e.PaisID
ORDER BY p.PaisID DESC;
/*Ejercicio 2 página 128 */
/*Apartado a*/
SELECT lib.titulo
FROM libro as lib
(WHERE lib.titulo like 'Guía%')
    AND
(WHERE lib.EditorialID !=
(SELECT EditorialID
FROM editorial
WHERE editorial.Nombre = 'Alfaguara';));
/*Apartado b*/
