CREATE TABLE Libro(
    L# VARCHAR2(4), 
	Titulo VARCHAR2(4),
    PRIMARY KEY(L#)
);

CREATE TABLE Copia(
    Cop# VARCHAR2(4), 
	L# VARCHAR2(4) REFERENCES Libro(L#),
    PRIMARY KEY(Cop#, L#)
);

CREATE TABLE Usuario(
    DNI VARCHAR2(9) PRIMARY KEY,
    NombreU VARCHAR2(4) NOT NULL
);

CREATE TABLE Tema (
    Tema# VARCHAR2(4),
    PRIMARY KEY(Tema#)
);

CREATE TABLE Autor(
    DNIA VARCHAR2(9) PRIMARY KEY, 
    NombreA VARCHAR2(9) NOT NULL
);

CREATE TABLE Prestado(
    Cop# VARCHAR2(4) REFERENCES Copia(Cop#),
	L# VARCHAR2(4) REFERENCES Copia(L#),
    Fecha VARCHAR2(4),
    DNI VARCHAR2(4) REFERENCES Usuario(DNI),
    PRIMARY KEY(Cop#, L#, Fecha)
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







