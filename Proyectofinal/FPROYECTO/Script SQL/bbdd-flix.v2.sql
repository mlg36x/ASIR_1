-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-05-2024 a las 09:31:16
-- Versión del servidor: 10.11.6-MariaDB-0+deb12u1
-- Versión de PHP: 8.2.18

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `FLIX`
--
DROP DATABASE IF EXISTS `FLIX`;
CREATE DATABASE IF NOT EXISTS `FLIX` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `FLIX`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `infopais_id`$$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `infopais_id` (IN `ID` INT(3))  COMMENT 'Devuelve información sobre un país a partir de su ID' BEGIN
DECLARE var1 varchar(56);
SELECT PAIS INTO var1 FROM PAISES WHERE ID_PAIS = ID;
SELECT concat("El país con el ID: ", ID, " es ", var1) as INFO;
END$$

DROP PROCEDURE IF EXISTS `infopais_nombre`$$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `infopais_nombre` (IN `nombre` VARCHAR(56))  COMMENT 'Devuelve información sobre un país a partir de su nombre o parecido' BEGIN
DECLARE var1 varchar(255);
DECLARE var2 INT(3);
DECLARE temp varchar(255);
SET temp = concat("%",nombre,"%");
SELECT PAIS INTO var1 FROM PAISES WHERE PAIS LIKE temp;
SELECT ID_PAIS INTO var2 FROM PAISES WHERE PAIS = var1;
SELECT concat("El ID: ",var2, " corresponde a ", var1);
END$$

DROP PROCEDURE IF EXISTS `insertar_actor`$$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `insertar_actor` (IN `NOMBRE` VARCHAR(25), IN `APELLIDO1` VARCHAR(30), IN `APELLIDO2` VARCHAR(30), IN `PAIS` INT(3))  COMMENT 'Inserta un autor en la tabla ACTORES, con formato {NOMBRE,APELLIDO,APELLIDO,PAIS}' BEGIN
DECLARE nom varchar(25);
DECLARE ap1 varchar(30);
DECLARE ap2 varchar(30);
DECLARE pais INT(3);
SET pais = PAIS;
SET nom = NOMBRE;
SET ap1 = APELLIDO1;
SET ap2 = APELLIDO2;
INSERT INTO ACTORES(AC_NOMBRE, AC_APELLIDO1, AC_APELLIDO2, AC_PAIS) values (nom, ap1, ap2, pais);
END$$

DROP PROCEDURE IF EXISTS `insertar_categoria`$$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `insertar_categoria` (IN `categoria` VARCHAR(60))  COMMENT 'Inserta una nueva categoria en la tabla CATEGORIAS' BEGIN
DECLARE newcat varchar(60);
SET newcat = categoria;
INSERT INTO CATEGORIAS (CATEG) values (newcat);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ACTORES`
--

DROP TABLE IF EXISTS `ACTORES`;
CREATE TABLE IF NOT EXISTS `ACTORES` (
  `ID_ACTOR` int(3) NOT NULL AUTO_INCREMENT,
  `AC_NOMBRE` varchar(25) NOT NULL DEFAULT 'JOHN',
  `AC_APELLIDO1` varchar(30) NOT NULL DEFAULT 'DOE',
  `AC_APELLIDO2` varchar(30) DEFAULT NULL,
  `AC_PAIS` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_ACTOR`),
  KEY `AC_PAIS` (`AC_PAIS`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ACTORES`
--

INSERT INTO `ACTORES` (`ID_ACTOR`, `AC_NOMBRE`, `AC_APELLIDO1`, `AC_APELLIDO2`, `AC_PAIS`) VALUES
(4, 'Uma', 'Thurman', NULL, 840),
(5, 'David', 'Carradine', NULL, 840),
(6, 'Lucy', 'Liu', NULL, 840),
(7, 'Vivica', 'Anjanetta', 'Fox', 840),
(8, 'Daryl', 'Hannah', NULL, 840),
(9, 'Michael', 'Madsen', NULL, 840),
(10, 'Julie', 'Dreyfus', NULL, 250),
(11, 'Chiaki', 'Kuriyama', NULL, 392),
(12, 'Sonny', 'Chiba', NULL, 392),
(13, 'Adam', 'Scott', NULL, 840),
(14, 'Zach', 'Cherry', NULL, 840),
(15, 'Brittney', 'Leigh', 'Lower', 840),
(16, 'Jen', 'Tullock', NULL, 840),
(17, 'Tramell', 'Tillman', NULL, 840),
(18, 'Dichen', 'Lachman', NULL, 36),
(19, 'Michael', 'Chernus', NULL, 840),
(20, 'John', 'Turturro', NULL, 840),
(21, 'Christopher', 'Walken', NULL, 840),
(22, 'Patricia', 'Tamara', 'Arquette', 840);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ACTOR_PELI`
--

DROP TABLE IF EXISTS `ACTOR_PELI`;
CREATE TABLE IF NOT EXISTS `ACTOR_PELI` (
  `ID_PELI` int(3) NOT NULL DEFAULT 0,
  `ID_ACTOR` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_PELI`,`ID_ACTOR`),
  KEY `ID_ACTOR` (`ID_ACTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ACTOR_PELI`
--

INSERT INTO `ACTOR_PELI` (`ID_PELI`, `ID_ACTOR`) VALUES
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ACTOR_SERIE`
--

DROP TABLE IF EXISTS `ACTOR_SERIE`;
CREATE TABLE IF NOT EXISTS `ACTOR_SERIE` (
  `ID_SERIE` int(3) NOT NULL DEFAULT 0,
  `ID_ACTOR` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_SERIE`,`ID_ACTOR`),
  KEY `ID_ACTOR` (`ID_ACTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ACTOR_SERIE`
--

INSERT INTO `ACTOR_SERIE` (`ID_SERIE`, `ID_ACTOR`) VALUES
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CATEGORIAS`
--

DROP TABLE IF EXISTS `CATEGORIAS`;
CREATE TABLE IF NOT EXISTS `CATEGORIAS` (
  `ID_CATEG` int(3) NOT NULL AUTO_INCREMENT,
  `CATEG` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_CATEG`),
  UNIQUE KEY `CATEG` (`CATEG`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `CATEGORIAS`
--

INSERT INTO `CATEGORIAS` (`ID_CATEG`, `CATEG`) VALUES
(2, 'Acción'),
(15, 'Animación'),
(12, 'Bélico'),
(13, 'Biográfico'),
(3, 'Ciencia ficción'),
(20, 'Cine experimental'),
(16, 'Cine independiente'),
(17, 'Cine negro'),
(1, 'Comedia'),
(22, 'de gángsters'),
(24, 'Documental'),
(9, 'Erótico'),
(4, 'Fantasía'),
(21, 'Histórico'),
(23, 'infantil'),
(10, 'Melodrama'),
(5, 'Musical'),
(11, 'Policíaco'),
(19, 'Road Movie'),
(8, 'Romance'),
(18, 'Serie B'),
(7, 'Suspense'),
(6, 'Terror'),
(25, 'Thriller psicológico'),
(14, 'Western');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DIRECTORES`
--

DROP TABLE IF EXISTS `DIRECTORES`;
CREATE TABLE IF NOT EXISTS `DIRECTORES` (
  `ID_DIREC` int(3) NOT NULL AUTO_INCREMENT,
  `DI_NOMBRE` varchar(25) NOT NULL DEFAULT 'JOHN',
  `DI_APELLIDO1` varchar(30) NOT NULL DEFAULT 'DOE',
  `DI_APELLIDO2` varchar(30) DEFAULT NULL,
  `DI_PAIS` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_DIREC`),
  KEY `DI_PAIS` (`DI_PAIS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `DIRECTORES`
--

INSERT INTO `DIRECTORES` (`ID_DIREC`, `DI_NOMBRE`, `DI_APELLIDO1`, `DI_APELLIDO2`, `DI_PAIS`) VALUES
(1, 'Quentin', 'Tarantino', NULL, 840),
(2, 'Ben', 'Stiller', NULL, 840),
(3, 'Aoife', 'McArdle', NULL, 372);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DIREC_PELI`
--

DROP TABLE IF EXISTS `DIREC_PELI`;
CREATE TABLE IF NOT EXISTS `DIREC_PELI` (
  `ID_PELI` int(3) NOT NULL DEFAULT 0,
  `ID_DIREC` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_PELI`,`ID_DIREC`),
  KEY `ID_DIREC` (`ID_DIREC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DIREC_SERIE`
--

DROP TABLE IF EXISTS `DIREC_SERIE`;
CREATE TABLE IF NOT EXISTS `DIREC_SERIE` (
  `ID_SERIE` int(3) NOT NULL DEFAULT 0,
  `ID_DIREC` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_SERIE`,`ID_DIREC`),
  KEY `ID_DIREC` (`ID_DIREC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `DIREC_SERIE`
--

INSERT INTO `DIREC_SERIE` (`ID_SERIE`, `ID_DIREC`) VALUES
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PAISES`
--

DROP TABLE IF EXISTS `PAISES`;
CREATE TABLE IF NOT EXISTS `PAISES` (
  `ID_PAIS` int(3) NOT NULL DEFAULT 0,
  `PAIS` varchar(56) NOT NULL,
  PRIMARY KEY (`ID_PAIS`),
  UNIQUE KEY `PAIS` (`PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PAISES`
--

INSERT INTO `PAISES` (`ID_PAIS`, `PAIS`) VALUES
(4, 'Afganistán'),
(8, 'Albania'),
(276, 'Alemania'),
(20, 'Andorra'),
(24, 'Angola'),
(660, 'Anguila'),
(10, 'Antártida'),
(28, 'Antigua y Barbuda'),
(682, 'Arabia Saudita'),
(12, 'Argelia'),
(32, 'Argentina'),
(51, 'Armenia'),
(533, 'Aruba'),
(36, 'Australia'),
(40, 'Austria'),
(31, 'Azerbaiyán'),
(44, 'Bahamas'),
(48, 'Bahrein'),
(831, 'Bailía de Guernsey'),
(50, 'Bangladesh'),
(52, 'Barbados'),
(112, 'Belarús'),
(56, 'Bélgica'),
(84, 'Belice'),
(204, 'Benín'),
(60, 'Bermudas'),
(68, 'Bolivia'),
(70, 'Bosnia y Hercegovina'),
(72, 'Botsuana'),
(76, 'Brasil'),
(96, 'Brunéi'),
(100, 'Bulgaria'),
(854, 'Burkina Faso'),
(108, 'Burundi'),
(64, 'Bután'),
(132, 'Cabo Verde'),
(116, 'Camboya'),
(120, 'Camerún'),
(124, 'Canadá'),
(535, 'Caribe Neerlandés'),
(634, 'Catar'),
(148, 'Chad'),
(203, 'Chequia'),
(152, 'Chile'),
(156, 'China'),
(196, 'Chipre'),
(336, 'Ciudad del Vaticano'),
(170, 'Colombia'),
(174, 'Comores'),
(408, 'Corea del Norte'),
(410, 'Corea del Sur'),
(384, 'Costa de Marfil'),
(188, 'Costa Rica'),
(191, 'Croacia'),
(192, 'Cuba'),
(531, 'Curaçao'),
(208, 'Dinamarca'),
(212, 'Dominica'),
(218, 'Ecuador'),
(818, 'Egipto'),
(222, 'El Salvador'),
(784, 'Emiratos Árabes Unidos'),
(232, 'Eritrea'),
(703, 'Eslovaquia'),
(705, 'Eslovenia'),
(724, 'España'),
(583, 'Estados Federados de Micronesia'),
(840, 'Estados Unidos de América'),
(233, 'Estonia'),
(748, 'Esuatini'),
(231, 'Etiopía'),
(608, 'Filipinas'),
(246, 'Finlandia'),
(242, 'Fiyi'),
(250, 'Francia'),
(266, 'Gabón'),
(270, 'Gambia'),
(268, 'Georgia'),
(239, 'Georgia del Sur y las Islas Sandwich del Sur'),
(288, 'Ghana'),
(292, 'Gibraltar'),
(308, 'Granada'),
(300, 'Grecia'),
(304, 'Groenlandia'),
(312, 'Guadalupe'),
(316, 'Guam'),
(320, 'Guatemala'),
(328, 'Guayana'),
(254, 'Guayana Francesa'),
(324, 'Guinea'),
(226, 'Guinea Ecuatorial'),
(624, 'Guinea-Bissau'),
(332, 'Haití'),
(340, 'Honduras'),
(344, 'Hong Kong'),
(348, 'Hungría'),
(356, 'India'),
(360, 'Indonesia'),
(364, 'Irán'),
(368, 'Iraq'),
(372, 'Irlanda'),
(74, 'Isla Bouvet'),
(833, 'Isla de Man'),
(162, 'Isla de Navidad'),
(663, 'Isla de San Mártin'),
(480, 'Isla Mauricio'),
(574, 'Isla Norfolk'),
(352, 'Islandia'),
(248, 'Islas Åland'),
(136, 'Islas Caimán'),
(166, 'Islas Cocos'),
(184, 'Islas Cook'),
(234, 'Islas Feroe'),
(334, 'Islas Heard y McDonald'),
(238, 'Islas Malvinas'),
(580, 'Islas Marianas del Norte'),
(584, 'Islas Marshall'),
(612, 'Islas Pitcairn'),
(90, 'Islas Solomón'),
(796, 'Islas Turcas y Caicos'),
(581, 'Islas ultramarinas menores de los Estados Unidos'),
(92, 'Islas Vírgenes (UK)'),
(850, 'Islas Vírgenes Americanas'),
(376, 'Israel'),
(380, 'Italia'),
(388, 'Jamaica'),
(392, 'Japón'),
(832, 'Jersey'),
(400, 'Jordania'),
(398, 'Kazajistán'),
(404, 'Kenia'),
(417, 'Kirguistán'),
(296, 'Kiribati'),
(412, 'Kosovo'),
(414, 'Kuwait'),
(418, 'Laos'),
(426, 'Lesotho'),
(428, 'Letonia'),
(422, 'Líbano'),
(430, 'Liberia'),
(434, 'Libia'),
(438, 'Liechtenstein'),
(440, 'Lituania'),
(442, 'Luxemburgo'),
(446, 'Macao'),
(807, 'Macedonia del Norte'),
(450, 'Madagascar'),
(458, 'Malasia'),
(454, 'Malaui'),
(462, 'Maldivas'),
(466, 'Malí'),
(470, 'Malta'),
(504, 'Marruecos'),
(474, 'Martinica'),
(478, 'Mauritania'),
(175, 'Mayotte'),
(484, 'México'),
(498, 'Moldavia'),
(496, 'Mongolia'),
(499, 'Montenegro'),
(500, 'Montserrat'),
(508, 'Mozambique'),
(104, 'Myanmar'),
(516, 'Namibia'),
(520, 'Nauru'),
(524, 'Nepal'),
(558, 'Nicaragua'),
(562, 'Níger'),
(566, 'Nigeria'),
(570, 'Niue'),
(578, 'Noruega'),
(540, 'Nueva Caledonia'),
(554, 'Nueva Zelandia'),
(512, 'Omán'),
(528, 'Paises Bajos'),
(586, 'Pakistán'),
(585, 'Palaos'),
(275, 'Palestina'),
(591, 'Panamá'),
(598, 'Papúa Nueva Guinea'),
(600, 'Paraguay'),
(604, 'Perú'),
(258, 'Polinesia Francesa'),
(616, 'Polonia'),
(620, 'Portugal'),
(492, 'Principado de Mónaco'),
(630, 'Puerto Rico'),
(826, 'Reino Unido'),
(140, 'República Centroafricana'),
(178, 'República del Congo'),
(180, 'República Democrática del Congo'),
(214, 'República Dominicana'),
(638, 'Reunión'),
(646, 'Ruanda'),
(642, 'Rumania'),
(643, 'Rusia'),
(732, 'Sáhara Occidental'),
(882, 'Samoa'),
(16, 'Samoa Americana'),
(652, 'San Bartolomé'),
(659, 'San Cristóbal y Nieves'),
(674, 'San Marino'),
(666, 'San Pedro y Miguelón'),
(670, 'San Vicente y las Granadinas'),
(654, 'Santa Elena, Ascensión y Tristán de Acuña'),
(662, 'Santa Lucía'),
(678, 'Santo Tomé y Príncipe'),
(686, 'Senegal'),
(688, 'Serbia'),
(690, 'Seychelles'),
(694, 'Sierra Leona'),
(702, 'Singapur'),
(534, 'Sint Maarten'),
(760, 'Siria'),
(706, 'Somalia'),
(144, 'Sri Lanka'),
(710, 'Sudáfrica'),
(729, 'Sudán'),
(728, 'Sudán del Sur'),
(752, 'Suecia'),
(756, 'Suiza'),
(740, 'Surinam'),
(744, 'Svalbard y Jan Mayen'),
(764, 'Tailandia'),
(158, 'Taiwán'),
(834, 'Tanzania'),
(762, 'Tayikistán'),
(86, 'Territorio Británico del Océano Índico'),
(260, 'Territorios Australes y Antárticos Franceses'),
(626, 'Timor Oriental'),
(768, 'Togo'),
(772, 'Tokelau'),
(776, 'Tonga'),
(780, 'Trinidad y Tobago'),
(788, 'Túnez'),
(795, 'Turkmenistán'),
(792, 'Turquía'),
(798, 'Tuvalu'),
(804, 'Ucrania'),
(800, 'Uganda'),
(858, 'Uruguay'),
(860, 'Uzbekistán'),
(548, 'Vanuatu'),
(862, 'Venezuela'),
(704, 'Vietnam'),
(876, 'Wallis y Futuna'),
(887, 'Yemen'),
(262, 'Yibuti'),
(894, 'Zambia'),
(716, 'Zimbabue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PELICULAS`
--

DROP TABLE IF EXISTS `PELICULAS`;
CREATE TABLE IF NOT EXISTS `PELICULAS` (
  `ID_PELI` int(3) NOT NULL AUTO_INCREMENT,
  `P_TITULO` varchar(255) NOT NULL,
  `P_PRESUPUESTO` float NOT NULL,
  `P_ESTRENO` date NOT NULL,
  `P_SECUELA` tinyint(1) DEFAULT NULL,
  `P_PAIS` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_PELI`),
  KEY `P_PAIS` (`P_PAIS`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PELICULAS`
--

INSERT INTO `PELICULAS` (`ID_PELI`, `P_TITULO`, `P_PRESUPUESTO`, `P_ESTRENO`, `P_SECUELA`, `P_PAIS`) VALUES
(1, 'Kill Bill', 60000000, '2003-10-10', NULL, 840);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PELI_CATEG`
--

DROP TABLE IF EXISTS `PELI_CATEG`;
CREATE TABLE IF NOT EXISTS `PELI_CATEG` (
  `ID_PELI` int(3) NOT NULL DEFAULT 0,
  `ID_CATEG` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_PELI`,`ID_CATEG`),
  KEY `ID_CATEG` (`ID_CATEG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PELI_CATEG`
--

INSERT INTO `PELI_CATEG` (`ID_PELI`, `ID_CATEG`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SERIES`
--

DROP TABLE IF EXISTS `SERIES`;
CREATE TABLE IF NOT EXISTS `SERIES` (
  `ID_SERIE` int(3) NOT NULL AUTO_INCREMENT,
  `S_TITULO` varchar(255) NOT NULL,
  `S_PRESUPUESTO` float NOT NULL,
  `S_ESTRENO` date NOT NULL,
  `S_TEMP` int(3) NOT NULL DEFAULT 1,
  `S_PAIS` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_SERIE`),
  KEY `S_PAIS` (`S_PAIS`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `SERIES`
--

INSERT INTO `SERIES` (`ID_SERIE`, `S_TITULO`, `S_PRESUPUESTO`, `S_ESTRENO`, `S_TEMP`, `S_PAIS`) VALUES
(1, 'Severance', 0, '2022-02-18', 1, 840);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SERIE_CATEG`
--

DROP TABLE IF EXISTS `SERIE_CATEG`;
CREATE TABLE IF NOT EXISTS `SERIE_CATEG` (
  `ID_SERIE` int(3) NOT NULL DEFAULT 0,
  `ID_CATEG` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_SERIE`,`ID_CATEG`),
  KEY `ID_CATEG` (`ID_CATEG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `SERIE_CATEG`
--

INSERT INTO `SERIE_CATEG` (`ID_SERIE`, `ID_CATEG`) VALUES
(1, 3),
(1, 25);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ACTORES`
--
ALTER TABLE `ACTORES`
  ADD CONSTRAINT `ACTORES_ibfk_1` FOREIGN KEY (`AC_PAIS`) REFERENCES `PAISES` (`ID_PAIS`);

--
-- Filtros para la tabla `ACTOR_PELI`
--
ALTER TABLE `ACTOR_PELI`
  ADD CONSTRAINT `ACTOR_PELI_ibfk_1` FOREIGN KEY (`ID_PELI`) REFERENCES `PELICULAS` (`ID_PELI`),
  ADD CONSTRAINT `ACTOR_PELI_ibfk_2` FOREIGN KEY (`ID_ACTOR`) REFERENCES `ACTORES` (`ID_ACTOR`);

--
-- Filtros para la tabla `ACTOR_SERIE`
--
ALTER TABLE `ACTOR_SERIE`
  ADD CONSTRAINT `ACTOR_SERIE_ibfk_1` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`),
  ADD CONSTRAINT `ACTOR_SERIE_ibfk_2` FOREIGN KEY (`ID_ACTOR`) REFERENCES `ACTORES` (`ID_ACTOR`);

--
-- Filtros para la tabla `DIRECTORES`
--
ALTER TABLE `DIRECTORES`
  ADD CONSTRAINT `DIRECTORES_ibfk_1` FOREIGN KEY (`DI_PAIS`) REFERENCES `PAISES` (`ID_PAIS`);

--
-- Filtros para la tabla `DIREC_PELI`
--
ALTER TABLE `DIREC_PELI`
  ADD CONSTRAINT `DIREC_PELI_ibfk_1` FOREIGN KEY (`ID_PELI`) REFERENCES `PELICULAS` (`ID_PELI`),
  ADD CONSTRAINT `DIREC_PELI_ibfk_2` FOREIGN KEY (`ID_DIREC`) REFERENCES `DIRECTORES` (`ID_DIREC`);

--
-- Filtros para la tabla `DIREC_SERIE`
--
ALTER TABLE `DIREC_SERIE`
  ADD CONSTRAINT `DIREC_SERIE_ibfk_1` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`),
  ADD CONSTRAINT `DIREC_SERIE_ibfk_2` FOREIGN KEY (`ID_DIREC`) REFERENCES `DIRECTORES` (`ID_DIREC`);

--
-- Filtros para la tabla `PELICULAS`
--
ALTER TABLE `PELICULAS`
  ADD CONSTRAINT `PELICULAS_ibfk_1` FOREIGN KEY (`P_PAIS`) REFERENCES `PAISES` (`ID_PAIS`);

--
-- Filtros para la tabla `PELI_CATEG`
--
ALTER TABLE `PELI_CATEG`
  ADD CONSTRAINT `PELI_CATEG_ibfk_1` FOREIGN KEY (`ID_PELI`) REFERENCES `PELICULAS` (`ID_PELI`),
  ADD CONSTRAINT `PELI_CATEG_ibfk_2` FOREIGN KEY (`ID_CATEG`) REFERENCES `CATEGORIAS` (`ID_CATEG`);

--
-- Filtros para la tabla `SERIES`
--
ALTER TABLE `SERIES`
  ADD CONSTRAINT `SERIES_ibfk_1` FOREIGN KEY (`S_PAIS`) REFERENCES `PAISES` (`ID_PAIS`);

--
-- Filtros para la tabla `SERIE_CATEG`
--
ALTER TABLE `SERIE_CATEG`
  ADD CONSTRAINT `SERIE_CATEG_ibfk_1` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`),
  ADD CONSTRAINT `SERIE_CATEG_ibfk_2` FOREIGN KEY (`ID_CATEG`) REFERENCES `CATEGORIAS` (`ID_CATEG`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
