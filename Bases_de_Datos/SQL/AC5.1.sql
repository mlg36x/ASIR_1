SELECT * FROM socio
    WHERE Nombre = 'Jacinto' AND (YEAR(Nacimiento<'1970-01-01')AND YEAR(Alta='1990-01-01')); 
SELECT * FROM libro
    WHERE ((EditorialID != 15) AND (EditorialID != 32)) or (YEAR(aniopublicacion < 2000));

SELECT Nombre, Apellidos from socio
    WHERE Telefono IS NOT NULL AND Direccion IS NULL;

SELECT * FROM autor
    WHERE Apellidos = 'Byatt' AND Nombre LIKE 'A%S%'; 