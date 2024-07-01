SELECT pais.Nombre as 'País',
    autor.Nombre as 'Nombre',
    autor.Apellidos AS 'Apellidos'
FROM autorpais
    INNER JOIN pais ON autorpais.PaisID = pais.PaisID
    INNER JOIN autor ON autorpais.AutorID = autor.AutorID;
SELECT lib.titulo,
    tem.Nombre
from librotema as lt
    RIGHT JOIN libro as lib ON lt.libroID = lib.libroID
    RIGHT JOIN tema as tem ON lt.TemaID = tem.TemaID;