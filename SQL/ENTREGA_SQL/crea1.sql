CREATE TABLE Clientes(
    DNI VARCHAR2(9) PRIMARY KEY,
    Domicilio VARCHAR(40) NOT NULL,
    Teléfono INT
);

CREATE TABLE CC(
    CC# VARCHAR2(24) PRIMARY KEY,
    Fecha DATE NOT NULL,
    Saldo INT DEFAULT 0
);

CREATE TABLE Titular(
    DNI VARCHAR2(9) REFERENCES Clientes(DNI),
    CC# VARCHAR2(24) REFERENCES CC(CC#),
    
    PRIMARY KEY(DNI, CC#)
);

CREATE TABLE Tarjeta(
    T# VARCHAR2(18) PRIMARY KEY,
    DNI VARCHAR2(9) NOT NULL,
    CC# VARCHAR2(24),
    Tipo VARCHAR2(30) CHECK (Tipo IN('debito','credito','revolventes','prepago','contactless')),
    
    FOREIGN KEY(DNI,CC#) REFERENCES Titular(DNI,CC#)
);

