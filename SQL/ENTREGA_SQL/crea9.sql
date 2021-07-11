CREATE TABLE Receta(
    CODR VARCHAR2(4) PRIMARY KEY,
    Nombre VARCHAR2(15) NOT NULL,
    Tipo VARCHAR2(15) NOT NULL,
    Dificultad VARCHAR2(7) CHECK(Dificultad IN ('Facil','Medio','Dificil'))
);

CREATE TABLE Ingrediente(
    CODI VARCHAR2(4) PRIMARY KEY,
    Nombre VARCHAR2(15) NOT NULL,
    Tipo VARCHAR2(15) NOT NULL,
    Precio INT NOT NULL CHECK(Precio > 0)
);

CREATE TABLE Incluye(
    CODR VARCHAR2(4) REFERENCES Receta(CODR),
    CODI VARCHAR2(4) REFERENCES Ingrediente(CODI),
    Paso VARCHAR2(30),
    
    PRIMARY KEY(CODR,CODI,Paso)
);
