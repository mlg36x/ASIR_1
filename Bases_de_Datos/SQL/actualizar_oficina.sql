ALTER TABLE empleado
    DROP if exists fecha_nac;

ALTER TABLE empleado
    ADD if not exists Email VARCHAR(256) /*CHECK '%@%.%'*/ UNIQUE NOT NULL;

ALTER TABLE empleado    
    MODIFY Direccion VARCHAR(256);