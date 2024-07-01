LOCK TABLES PAIS WRITE;
INSERT INTO PAIS (PaisID, Nombre) VALUES
(020, "Andorra"),
(032, "Argentina"),
(036, "Australia"),
(056, "Bélgica"),
(124, "Canadá"),
(152, "Chile"),
(276, "Alemania"),
(732, "Sahara Occidental"),
(724, "España"),
(250, "Francia"),
(826, "Reino Unido"),
(300, "Grecia"),
(392, "Japón"),
(504, "Marruecos"),
(620, "Portugal"),
(840, "USA"),
(752, "Suecia"),
(258,"Perú"),
(170,"Colombia");
UNLOCK TABLES; 

LOCK TABLES TEMA WRITE;
INSERT INTO TEMA
(Nombre) VALUES ("INFANTIL"),
                ("JUVENIL"),
                ("NARRATIVA"),
				("HISTORIA"),
                ("GEOGRAFIA"),
                ("CIENCIAS SOCIALES Y POLITICA"),
                ("MEDICINA Y SALUD"),
                ("CIENCIAS FISICAS"),
                ("FILOSOFIA"),
                ("CIENCIAS AMBIENTALES"),
                ("ARQUITECTURA"),
                ("ARTES PLÁSTICAS"),
                ("GASTRONOMÍA"),
                ("MANUALIDADES Y ARTESANÍAS"),
                ("TERAPIAS"),
                ("NEGOCIOS"),
                ("COMUNICACIÓN"),
                ("GÉNERO"),
                ("IDIOMAS"),
                ("REVISTAS ESPECIALIZADAS"),
                ("VARIOS"),
                ("DVD"),
                ("JUEGOS DE MESA");
UNLOCK TABLES; 
                
LOCK TABLES AUTOR WRITE; 
INSERT INTO AUTOR
(Nombre, Apellidos) VALUES ("J.J.","Benítez"),
                           ("Stieg", "Larson"),
                           ("Dominique","Lapierre"),
                           ("José", "Saramago"),
                           ("Juan Manuel", "de Prada"),
                           ("Isabel", "Allende"),
                           ("Michael","Ende"),
                           ("Ken","Follet"),
                           ("Mario","Vargas Llosa"),
                           ("Antonio","Gala"),
                           ("Stephen","King"),
                           ("Julio","Verne"),
                           ("Julia","Navarro"),
                           ("Oscar", "Wilde"),
                           ("Carlos","Ruíz Zafón"),
                           ("Agatha", "Christie"),
                           ("Arturo", "Pérez-Reverte"),
                           ("Eduardo","Mendoza"),
                           ("Julio", "Cortázar"),
                           ("Gabriel", "García Márquez");
UNLOCK TABLES;

LOCK TABLES SOCIO WRITE; 
INSERT INTO SOCIO (NIF, Nombre, Apellidos, Direccion, Telefono, Nacimiento, Alta)
VALUES            ("11111111A", "Pedro","Sánchez López", "Calle Huertas nº 7", "917865432","1974-10-11","2021-01-31"),
                  ("11111111B", "Marta","López García", "Calle La Paz nº11", "914576431","1990-08-01","2010-01-31"),
                  ("11111111C", "Nicolás","Pardo Solana", "Calle Sahara nº 4", "917953511","2011-02-22","2020-03-04"),
                  ("11111111D", "Candela","Peña Roca", "Calle Toledo nº 25", "917865432","1981-07-21","2021-01-31");
UNLOCK  TABLES;

LOCK TABLES EDITORIAL WRITE;
INSERT INTO EDITORIAL (Nombre, PaisID)
VALUES            ("Alfaguara", 724),
                  ("Circulo de Lectores", 724),
                  ("Booket", 724),
                  ("Austral",724),
                  ("Seix-Barral",724),
                  ("Plaza & Janés",724),
                  ("Hachette",250),
                  ("Alianza",250),
                  ("Ediciones Universal",840),
                  ("Kensintong Editorial",840),
                  ("De Bolsillo",724),
                  ("Destino",724),
                  ("Planeta",724);
UNLOCK TABLES; 
LOCK TABLES LIBRO WRITE;
INSERT INTO LIBRO (libroID,titulo, aniopublicacion, EditorialID)
VALUES (1,"Caballo de Troya 1",1984,13),
       (2,"Los hombres que no amaban a las mujeres",2009,12),
	   (3,"La caverna",2000,1),
       (4,"Afrodita",1997,2),
       (5,"La fiesta del Chivo",2000,1),
       (6,"La pasión turca",2003,3),
       (7,"It",2016,9),
       (8,"Dime quién soy",2014,11),
       (9,"Retrato de Dorian Grey",1990,4),
       (10,"La sombra del viento",2016,3),
       (11,"La tabla de flandes",1995,11),
       (12,"Una comedia ligera",2016,3),
       (13,"Rayuela",1984,11),
       (14,"Cien años de Soledad",1985,1),
       (15,"La ciudad de la alegría",1980,5),
       (16,"La Tempestad",1987,12),
       (17,"Los pilares de la tierra",2001,6);
       UNLOCK TABLES;
        INSERT INTO EJEMPLAR (signatura,libroID)
VALUES ("CBTR01JJBEN",1),
       ("LHQN01STLAR",2),
	   ("LCB01JSSARAM",3),
       ("AFROD01ISALL",4),
       ("LFDCH01MVLL",5),
       ("LPST01ANTGAL",6),
       ("IT01STPKING",7),
       ("DQUS01JULNAV",8),
       ("RDDG01OWILDE",9),
       ("LSDV01CRZF",10),
       ("LTDF01APR",11),
       ("UCMLG01EDMEN",12),
       ("RAYU01JULCOR",13),
       ("CADSOL01GGM",14),
       ("LCDLA01DOMLAP",15),
       ("LATEMP01JMDP",16),
       ("LPDLT01KENF",17);
       UNLOCK TABLES;           
       
LOCK TABLES LIBROAUTOR WRITE;
INSERT INTO LIBROAUTOR (libroID,AutorID)
VALUES (1,1),
       (2,2),
	   (3,4),
       (4,6),
       (5,9),
       (6,10),
       (7,11),
       (8,13),
       (9,14),
       (10,15),
       (11,17),
       (12,18),
       (13,19),
       (14,20),
       (15,3),
       (16,5),
       (17,8);
       UNLOCK TABLES;
 LOCK TABLES lIBROTEMA WRITE;
INSERT INTO LIBROTEMA (LibroID,TemaID)
VALUES (1,3),
       (2,2),
	   (3,9),
       (4,2),
       (5,4),
       (6,3),
       (7,2),
       (8,3),
       (9,2),
       (10,3),
       (11,2),
       (12,2),
       (13,3),
       (14,6),
       (15,3),
       (16,3),
       (17,3);
       UNLOCK TABLES;
       
       LOCK TABLES AUTORPAIS WRITE;
INSERT INTO AUTORPAIS (AutorID,PaisID)
VALUES (1,724),
       (2,752),
	   (3,250),
       (4,620),
       (5,724),
       (6,152),
       (7,840),
       (8,826),
       (9,258),
       (10,724),
       (11,840),
       (12,250),
       (13,724),
       (14,826),
       (15,724),
       (16,826),
       (17,724),
       (18,724),
       (19,56),
       (20,170);
       UNLOCK TABLES;
       
LOCK TABLES PRESTAMO WRITE;
INSERT INTO PRESTAMO (Signatura,NIF,Prestamo)
VALUES ("CBTR01JJBEN","11111111A","2021-31-01");
UNLOCK TABLES;