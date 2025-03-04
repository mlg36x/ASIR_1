CREATE DATABASE IF NOT exists Biblioteca;
USE Biblioteca; 
CREATE TABLE PAIS (
PaisID INT NOT NULL UNIQUE PRIMARY KEY,
Nombre VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS TEMA (
TemaID INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS AUTOR (
AutorID INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(30) NOT NULL,
Apellidos VARCHAR(60) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE if not exists SOCIO (
NIF CHAR(9) NOT NULL UNIQUE PRIMARY KEY,
Nombre VARCHAR(30) NOT NULL,
Apellidos VARCHAR(60) NOT NULL,
Direccion VARCHAR(100),
Telefono CHAR(12) NOT NULL,
Nacimiento DATE NOT NULL,
Alta DATE NOT NULL CHECK (Alta >= "2003-09-01")
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE if not exists EDITORIAL (
EditorialID SMALLINT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(40) NOT NULL,
PaisID INT DEFAULT 724,
FOREIGN KEY (PaisID) REFERENCES pais (PaisID)
ON UPDATE CASCADE
ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE if not exists LIBRO(
libroID INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(30) NOT NULL,
aniopublicacion NUMERIC(4,0),
EditorialID SMALLINT,
FOREIGN KEY (EditorialID) REFERENCES editorial (EditorialID) 
ON UPDATE CASCADE
ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE if not exists EJEMPLAR (
signatura VARCHAR(15) NOT NULL UNIQUE PRIMARY KEY,
libroID INT NOT NULL,
FOREIGN KEY (libroID) REFERENCES libro (libroID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE if not exists LIBROAUTOR (
libroID INT NOT NULL ,
AutorID INT NOT NULL ,
PRIMARY KEY (libroID, AutorID),
FOREIGN KEY (libroID) REFERENCES libro (libroID) ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (AutorID) REFERENCES autor (AutorID) 
ON UPDATE CASCADE
ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE if not exists LIBROTEMA (
libroID INT NOT NULL ,
TemaID INT NOT NULL ,
PRIMARY KEY (libroID, TemaID),
FOREIGN KEY (libroID) REFERENCES libro (libroID) ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (TemaID) REFERENCES tema (TemaID) ON UPDATE CASCADE
ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE if not exists PRESTAMO (
Signatura VARCHAR(15) NOT NULL ,
NIF CHAR(9) NOT NULL ,
Prestamo DATE NOT NULL,
PRIMARY KEY (Signatura, NIF, Prestamo),
FOREIGN KEY (Signatura) REFERENCES ejemplar (Signatura)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (NIF) REFERENCES socio (NIF) ON UPDATE CASCADE
ON DELETE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE if not exists AUTORPAIS(
AutorID INT NOT NULL ,
PaisID INT  ,
PRIMARY KEY (AutorID,PaisID),
FOREIGN KEY (AutorID) REFERENCES autor (AutorID),
FOREIGN KEY (PaisID) REFERENCES pais (PaisID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;