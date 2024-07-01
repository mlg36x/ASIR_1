CREATE TABLE IF NOT EXISTS Departamento(
    Cod_depar INT(1) PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
    Nom_depar VARCHAR(60) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS Empleado(
    Cod_empleado INT(3) PRIMARY KEY UNIQUE NOT NULL,
    Nombre VARCHAR(60) NOT NULL,
    Apellidos VARCHAR(125) NOT NULL,
    Direccion VARCHAR(125) NOT NULL,
    Cod_depar INT(1),
    fecha_nac date NOT NULL,
    FOREIGN KEY (Cod_depar) REFERENCES Departamento (Cod_depar)
);