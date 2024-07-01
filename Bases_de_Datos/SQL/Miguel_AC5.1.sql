SELECT *
FROM socio
WHERE Nombre = 'Jacinto'
    AND (
        YEAR(Nacimiento > 1970)
        AND YEAR(Alta = 1990)
    );
SELECT *
FROM Libro
WHERE (
        (
            EditorialID != 15
            or EditorialID != 32
        )
    )
    or YEAR(aniopublicacion < 2000);
SELECT Nombre,
    Apellidos
FROM socio
WHERE Telefono IS NOT NULL
    AND Direccion IS NULL;
SELECT *
FROM AUTOR
WHERE Nombre = 'A%'
    AND Apellidos = '%S%';