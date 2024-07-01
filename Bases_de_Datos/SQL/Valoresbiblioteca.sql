INSERT INTO PAIS(PaisID, Nombre)
VALUES (4, 'Afghanistan'),
    (248, 'Åland Islands'),
    (8, 'Albania'),
    (12, 'Algeria'),
    (16, 'American Samoa'),
    (20, 'Andorra'),
    (24, 'Angola'),
    (660, 'Anguilla'),
    (10, 'Antarctica'),
    (28, 'Antigua and Barbuda'),
    (32, 'Argentina'),
    (51, 'Armenia'),
    (533, 'Aruba'),
    (36, 'Australia'),
    (40, 'Austria'),
    (31, 'Azerbaijan'),
    (170, 'Colombia'),
    (152, 'Chile'),
    (604, 'Peru'),
    (392, 'Japan'),
    (826, 'United Kingdom');
INSERT INTO TEMA(Nombre)
VALUES ('Ficcion Literaria'),
    ('Ciencia Ficcion'),
    ('Misterio y suspense'),
    ('Literatura Clasica');
INSERT INTO AUTOR(Nombre, Apellidos)
VALUES ('Gabriel', 'García Márquez'),
    ('Isabel', 'Allende'),
    ('Mario', 'Vargas Llosa'),
    ('Haruki', 'Murakami'),
    ('George', 'Orwell');
INSERT INTO socio(
        NIF,
        Nombre,
        Apellidos,
        Direccion,
        Telefono,
        Nacimiento,
        Alta
    )
VALUES (
        '12345678A',
        'Juan',
        'Gomez Rodriguez',
        'Calle Principal 123',
        '000987654321',
        '1980-05-15',
        '2020-01-10'
    ),
    (
        '98765432B',
        'Maria',
        'Lopez Martinez',
        'Avenida Secundaria 456',
        '000123456789',
        '1992-09-20',
        '2018-03-22'
    ),
    (
        '55555555C',
        'Carlos',
        'Gonzalez Sanchez',
        'Plaza Imaginaria 789',
        '000111111111',
        '1975-11-03',
        '2015-07-12'
    ),
    (
        '22222222D',
        'Ana',
        'Fernandez Garcia',
        'Ruta Ficticia 321',
        '000999999999',
        '1988-07-18',
        '2019-11-05'
    );

INSERT INTO editorial(Nombre, PaisID)
VALUES ('Editorial1',248),
    (
        'Editorial2',28),
    ('Editorial3',31),
    (
        'Nueva Editorial',660);

INSERT INTO libro(titulo, aniopublicacion, EditorialID)
VALUES ('1984',1949,1),
    ('Cien años de soledad',1967,2),
    ('La casa de los espíritus',1982,3),
    ('La ciudad y los perros',1963,4),
    ('Norwegian Wood',1987,4);

INSERT INTO ejemplar(signatura, libroID)
VALUES ('AAA111BBB222CD1', 5),
    ('BBB222CCC333DE1', 3),
    ('CCC333DDD444EF1', 1);

INSERT INTO libroautor(libroID, AutorID)
VALUES (1,5),
(2,1),
(3,2),
(4,3),
(5,4);

INSERT INTO librotema(libroID, TemaID)
VALUES (1,2),
(2,4),
(3,4),
(4,4),
(5,1);

INSERT INTO prestamo(signatura, NIF, Prestamo)
VALUES('CCC333DDD444EF1','98765432B','2022-09-22'),
('AAA111BBB222CD1','12345678A','2021-04-06'),
('BBB222CCC333DE1','22222222D','2020-03-01');

INSERT INTO AUTORPAIS(AutorID,PaisID)
VALUES(1,170),
(2,152),
(3,604),
(4,392),
(5,826);