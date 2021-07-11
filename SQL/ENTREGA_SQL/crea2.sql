CREATE TABLE Libro(
    L# VARCHAR2(4) PRIMARY KEY,
    Titulo VARCHAR(20) NOT NULL
);

CREATE TABLE Usuario(
    DNI VARCHAR2(9) PRIMARY KEY,
    Nombre VARCHAR(9) NOT NULL
);

CREATE TABLE Tema(
    Tema# VARCHAR2(4) PRIMARY KEY
);

CREATE TABLE Autor(
    DNIA VARCHAR2(9) PRIMARY KEY,
    NombreA VARCHAR2(9) NOT NULL  
);

CREATE TABLE Prestado(
    L# VARCHAR2(4) REFERENCES Libro(L#),
    Fecha DATE NOT NULL,
    DNI VARCHAR2(9) REFERENCES Usuario(DNI),
    
    PRIMARY KEY(L#, Fecha),
    UNIQUE(Fecha, DNI)
);

CREATE TABLE Trata(
    L# VARCHAR2(4) REFERENCES Libro(L#),
    Tema# VARCHAR2(4) REFERENCES Tema(Tema#),
    
    PRIMARY KEY(L#, Tema#)
);

CREATE TABLE Escribe(
    L# VARCHAR2(4) REFERENCES Libro(L#),
    DNIA VARCHAR2(9) REFERENCES Autor(DNIA),
    
    PRIMARY KEY(L#, DNIA)
);